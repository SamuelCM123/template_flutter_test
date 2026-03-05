import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/modules/tickets/providers/socket_service_provider.dart';
import 'package:template_flutter_test/modules/tickets/providers/socket_service_pure_provider.dart';
import 'package:template_flutter_test/shared/api/providers/apiApp_provider.dart';

final publicProvider = NotifierProvider<PublicNotifier, PublicState>(() {
  return PublicNotifier();
});

class PublicNotifier extends Notifier<PublicState> {

  @override
  PublicState build() {
    
    Future.microtask(() async {
      ref.listen(workingOnTicketStream, (previous, next) {
        // print('socketStreamPureProvider: $next');
        next.whenData((tickets){
          // if(tickets.isNotEmpty){
            state = state.copyWith(ticketsPending: tickets);
          // }
        });
      });
      await getTicketWorking();
    });
  
    return PublicState(ticketsPending: []); 
  }

  Future<void> getTicketWorking() async {

    try{
      final apiApp = ref.read(apiAppProvider);
      final response = await apiApp.get('/working-on'); 
      final List<dynamic>? data = response.data;
      final List<Ticket> finalTickets = data!.map((e) => Ticket.fromJson(e as Map<String, dynamic>)).toList();

      state = state.copyWith(ticketsPending: finalTickets);
    }
    catch(e){
      print('error:$e');
      return;
    }

  }

  set ticketsPending(List<Ticket>? ticketsPending) {
    state = state.copyWith(ticketsPending: ticketsPending);
  }

}

class PublicState {

  final List<Ticket>? ticketsPending;

  PublicState({required this.ticketsPending});

  PublicState copyWith({
    List<Ticket>? ticketsPending,
  }) {
    return PublicState(
      ticketsPending: ticketsPending,
    );
  }

}