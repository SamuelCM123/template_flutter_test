
import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/shared/socket/socket_instance.dart';

final socketStreamProvider = StreamProvider<List<Ticket>>((ref){

  final socket = SocketInstance().socket;

  final controller = StreamController<List<Ticket>>();

  void handleTicketUpdate(dynamic data) {
    try{
      if(data is List){
        print('Ticket on process: $data');
        final tickets = data.map((e) => Ticket.fromJson(e)).toList();

        if(!controller.isClosed){
          controller.add(tickets);
        }
      }
    }
    catch(e,stack){
      print('Error:$e');
      controller.addError(e, stack);
    }
  }

  socket?.on('on-working-on-ticket', handleTicketUpdate);

  ref.onDispose(() {
    socket?.off('on-working-on-ticket', handleTicketUpdate);
    controller.close();
  });

  return controller.stream;
});

// class TicketUpdateNotifier extends Notifier<TicketUpdateState> {

//   final socket = SocketInstance().socket;

//   @override
//   TicketUpdateState build() {
    
//     socket?.on('on-working-on-ticket', (data) {
//       print('Ticket on process: $data');
//       state = state.copyWith(ticketsOnProcess: data);
//     });
//     return TicketUpdateState(ticketsOnProcess: {});
    
//   }



// }

// class TicketUpdateState {

//   final Map<String, dynamic> ticketsOnProcess;

//   TicketUpdateState({required this.ticketsOnProcess});

//   TicketUpdateState copyWith({
//     Map<String, dynamic>? ticketsOnProcess,
//   }) {
//     return TicketUpdateState(
//       ticketsOnProcess: ticketsOnProcess ?? this.ticketsOnProcess,
//     );
//   }

// }

class Ticket {
  final String id;
  final String number;
  final String createdAt;
  final String done;

  Ticket({
    required this.id,
    required this.number,
    required this.createdAt,
    required this.done,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'],
      number: json['number'],
      createdAt: json['created_at'],
      done: json['done'],
    );
  }
}