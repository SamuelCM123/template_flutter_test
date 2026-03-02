import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_flutter_test/modules/tickets/providers/socket_service_provider.dart';

class IndexScreen extends ConsumerStatefulWidget {
  const IndexScreen({super.key});

  @override
  ConsumerState<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends ConsumerState<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    // final ticketProvider = ref.watch(socketStreamProvider);

    // print('ticketProvider: $ticketProvider');

    return SingleChildScrollView(
      child: Column(
        children: [
          // TODO: Implementar el programa de colas con ticket en proceso
          Center(
            child: Text(
              'Programa de Colas',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          // TODO: Redireccionar a una nueva vista "DESK" para tender tickets
          // ticketProvider.when(
          //   data: (ticket) => ListView.builder(
          //     itemCount: ticketProvider.value?.length,
          //     itemBuilder: (context, index) {
          //       final ticket = ticketProvider.value![index];
          //       return ListTile(
          //         title: Text(ticket.id),
          //         subtitle: Text(ticket.createdAt.toString()),
          //       );
          //     },
          //   ),
          //   error: (error, stack) => Text(error.toString()),
          //   loading: () => const CircularProgressIndicator(),
          // ),
          // ListView.builder(
          //   itemBuilder: ,
          // )
        ],
      ),
    );
  }
}
