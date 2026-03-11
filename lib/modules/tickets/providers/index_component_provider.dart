import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/modules/tickets/providers/socket_service_provider.dart';
import 'package:template_flutter_test/modules/tickets/providers/socket_service_pure_provider.dart';
import 'package:template_flutter_test/shared/api/providers/apiApp_provider.dart';
import 'package:template_flutter_test/shared/helpers/encrypt/encrypt.dart';

final indexComponentProvider = NotifierProvider<IndexComponentNotifier, IndexComponentState>((){
  return IndexComponentNotifier();
});

class IndexComponentNotifier extends Notifier<IndexComponentState> {
  @override
  IndexComponentState build() {

    Future.microtask(() async {
      ref.listen(workingOnTicketStream, (previous, next) {
        // print('socketStreamPureProvider: $next');
        next.whenData((tickets){
          // print('tickets:$tickets');
          state = state.copyWith(ticketOnProcess: tickets); // TODO: Descomentar
        });
      });
      // ref.listen(workingOnTicketStream, (previous, next) {
      //   // print('socketStreamPureProvider: $next');
      //   next.whenData((tickets){
      //     print('tickets:$tickets');
      //     state = state.copyWith(ticketOnProcess: tickets);
      //   });
      // });
      getTicketWorking();
    });
    
    return IndexComponentState(ticketOnProcess: []);
  }

  Future<void> getTicketWorking() async {
  
    try{

      final apiApp = ref.read(apiAppProvider);
      final response = await apiApp.get('/working-on'); 
      print('response:$response');

      final String descrypted = ref.read(encryptServiceProvider).decrypt(response.data);
      print('descrypted:$descrypted');
      
      final List<dynamic>? data = jsonDecode(descrypted);
      final List<Ticket> finalTickets = data!.map((e) => Ticket.fromJson(e as Map<String, dynamic>)).toList();
      print(' finalTickets.length:${finalTickets.length}');

      state = state.copyWith(ticketOnProcess: finalTickets);

    }
    catch(e){
      print('error:$e');
      return;
    }
  }

  Future<void> deleteTickets() async {
    
    try{
      final apiApp = ref.read(apiAppProvider);
      final response = await apiApp.delete('/delete-tickets'); 
      print('response:$response');
    }
    catch(e){
      print('error:$e');
      return;
    }
  }

}

class IndexComponentState {
  
  final List<Ticket> ticketOnProcess;

  IndexComponentState({required this.ticketOnProcess});

  IndexComponentState copyWith({
    List<Ticket>? ticketOnProcess,
  }) {
    return IndexComponentState(
      ticketOnProcess: ticketOnProcess ?? this.ticketOnProcess,
    );
  }

}