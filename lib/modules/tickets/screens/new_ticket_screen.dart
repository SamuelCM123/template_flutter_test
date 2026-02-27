import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/modules/tickets/providers/new_ticket_provider.dart';
import 'package:template_flutter_test/shared/helpers/download/auto_update_apk.dart';

class NewTicketScreen extends ConsumerStatefulWidget {

  const NewTicketScreen({super.key});

  @override
  ConsumerState<NewTicketScreen> createState() => _NewTicketScreenState();
}

class _NewTicketScreenState extends ConsumerState<NewTicketScreen> {

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_)  async {
    //   ref.read(newTicketProvider.notifier).getTicket();
    // });
  }

  @override
  Widget build(BuildContext context) {

    // final ticketProvider = ref.watch(newTicketProvider);
    
    return SingleChildScrollView(
      child: Column(
        spacing: 5,
        children: [
          Center(
            child: Text('New Ticket Screen'),
          ),
          Center(
            // child: Text('Ticket: ${ticketProvider.newTicket}'),
          ),
          Center(
            // child: Text('Last Number Ticket: ${ticketProvider.lastTicketNumber}'),
          ),
          OutlinedButton.icon(
            onPressed: () { 
              print('Nuevo Ticket');
              // context.go('/dashboard/public');
              // ref.read(newTicketProvider.notifier).createTicket();
            }, 
            label: const Text('Nuevo Ticket'), 
            icon: const Icon(Icons.add)
          ),
          OutlinedButton.icon(
            onPressed: () { 
              print('Auto Update');
              AutoUpdateService().checkForUpdate();
            }, 
            label: const Text('Descarga APK'), 
            icon: const Icon(Icons.download)
          ),
          Center(
            child: Text('EL mau se la come entera'),
          ),
          Center(
            child: Text('EL mau se la come entera por dos'),
          ),
        ]
      )
    );
  }
}