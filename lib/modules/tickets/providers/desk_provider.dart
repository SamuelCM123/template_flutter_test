
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/modules/tickets/providers/desk_stream_provider.dart';
import 'package:template_flutter_test/modules/tickets/providers/socket_service_provider.dart';
import 'package:template_flutter_test/shared/api/providers/apiApp_provider.dart';
import 'package:template_flutter_test/shared/widgets/toast/toast_services.dart';

final deskProvider = NotifierProvider.autoDispose<DeskProvider, DeskState>((){
  
  return DeskProvider();
});

class DeskProvider extends Notifier<DeskState> {

  @override
  DeskState build() {

    Future.microtask(() async {
      ref.listen(ticketCountProvider, (previous, next) {
        next.whenData((tickets){
          // // print  ('tickets:$tickets');
          state = state.copyWith(ticketPending: tickets);
        });
      });

      getTicketPending();
    });

    return  DeskState(ticketPending: 0);
  }

  // TODO: AGREGAR PETICIÓN DE TICKET PENDIENTE
  void getTicketPending() async {
    
    try{

      final apiApp = ref.read(apiAppProvider);
      final response = await apiApp.get('/pending');
      // print  ('response sdasd:$response');
      final List<dynamic>? data = response.data;
      final List<Ticket> finalTickets = data!.map((e) => Ticket.fromJson(e as Map<String, dynamic>)).toList();
      // print  ('finalTickets.length:${finalTickets.length}');
      state = state.copyWith(
        ticketPending: finalTickets.length
      );

    }
    catch(e){
      // print  ('error:$e');
      return;
    }

  }


  void nextTicket(int idDesk) async {
    
    try{

      await finishTicket(idDesk);

      final apiApp = ref.read(apiAppProvider);
      final response = await apiApp.get('/draw/$idDesk');
  
      // print  ('response:$response');
      if(response.data['status'] == 'error') {
        ToastService.showToast(title: 'Atendiendo Ticket', message: response.data['message'], type: 'error');
        state = state.copyWith(
          ticketWorking: null
        );
        return;
      }

      final Map<String, dynamic> ticket = response.data['ticket'];
      final Ticket finalTicket = Ticket.fromJson(ticket);

      state = state.copyWith(
        ticketWorking: finalTicket
      );
      // print  ('next ticket:$response');
      

    }
    catch(e){
      return;
    }

  }

  Future<void> finishTicket(int idDesk) async {
    
    try{
      // print  ('state.ticketWorking:${state.ticketWorking?.id}');
      // if(state.ticketWorking == null) return;

      final apiApp = ref.read(apiAppProvider);
      final response = await apiApp.put('/done/${state.ticketWorking!.id}');

      // print  ('response:${response.data["status"]}');
      
      if(response.data["status"] == "ok") {
        // print  ('entro');
        state = state.copyWith(
          ticketWorking: null
        );
        return;
      }


      if(response.data['status'] == 'error') {
        ToastService.showToast(title: 'Finalización de Ticket', message: response.data['message'], type: 'error');
        state = state.copyWith(
          ticketWorking: null
        );
        return;
      }
      
    }
    catch(e){
      return;
    }

  }

}

class DeskState {

  final int ticketPending;
  Ticket? ticketWorking;

  DeskState({
    required this.ticketPending,
    this.ticketWorking 
  });

  DeskState copyWith({
    int? ticketPending,
    Ticket? ticketWorking
  }) => DeskState(
    ticketPending: ticketPending ?? this.ticketPending,
    ticketWorking: ticketWorking ?? this.ticketWorking
  );

}