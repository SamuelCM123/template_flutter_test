import 'package:hooks_riverpod/hooks_riverpod.dart';

final indexComponentProvider = NotifierProvider<IndexComponentNotifier, IndexComponentState>((){
  return IndexComponentNotifier();
});

class IndexComponentNotifier extends Notifier<IndexComponentState> {
  @override
  IndexComponentState build() {

    // TODO: Implementar el SOCKET para obtener tickets
    return IndexComponentState(ticketOnProcess: {});
  }
}

class IndexComponentState {
  
  final Map<String, dynamic> ticketOnProcess;

  IndexComponentState({required this.ticketOnProcess});

  IndexComponentState copyWith({
    Map<String, dynamic>? ticketOnProcess,
  }) {
    return IndexComponentState(
      ticketOnProcess: ticketOnProcess ?? this.ticketOnProcess,
    );
  }

}