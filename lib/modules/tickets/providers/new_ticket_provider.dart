
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_flutter_test/shared/api/providers/apiApp_provider.dart';

final newTicketProvider = NotifierProvider<NewTicket, NewTicketState>((){
  return NewTicket();
});

class NewTicket extends Notifier<NewTicketState> {

  @override
  NewTicketState build() {
    return NewTicketState(newTicket: 0, lastTicketNumber: 0);
  }

  // Future<int> getTicket () async {
  //   final apiApp = ref.read(apiAppProvider);
  //     final response = await apiApp.get('/last');
  //     print(response);
  //     state = state.copyWith(
  //       newTicket: response.data,
  //       lastTicketNumber: response.data
  //     );
  //     return response.data;
  // }

  // void createTicket () async {
  //   final apiApp = ref.read(apiAppProvider);
  //   final response = await apiApp.post('/');
  //   print('createTicket:$response');
  //   state = state.copyWith(
  //     lastTicketNumber: response.data["number"],
  //   );

  //   addNewTicket();
  // }

  void addNewTicket(){
    state = state.copyWith(
      newTicket: state.newTicket + 1
    );
  }

  set newValueTicket(int newValue){
    state = state.copyWith(
      newTicket: newValue
    );
  }

  set lastTicketNumber(int newValue){
    state = state.copyWith(
      lastTicketNumber: newValue
    );
  }
}

class NewTicketState {
  final int newTicket;
  final int lastTicketNumber;

  NewTicketState({required this.newTicket, required this.lastTicketNumber});

  NewTicketState copyWith({
    int? newTicket,
    int? lastTicketNumber,
  }) {
    return NewTicketState(
      newTicket: newTicket ?? this.newTicket,
      lastTicketNumber: lastTicketNumber ?? this.lastTicketNumber,
    );
  }
}