import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/modules/tickets/providers/new_ticket_provider.dart';
import 'package:template_flutter_test/shared/widgets/input/custom_input.dart';

class NewTicketScreen extends ConsumerStatefulWidget {

  const NewTicketScreen({super.key});

  @override
  ConsumerState<NewTicketScreen> createState() => _NewTicketScreenState();
}

class _NewTicketScreenState extends ConsumerState<NewTicketScreen> {

  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final ticketProvider = ref.watch(newTicketProvider);
    
    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        children: [
          Center(
            child: Text('Ticket: ${ticketProvider.newTicket}'),
          ),
          Center(
            child: Text('Last Number Ticket: ${ticketProvider.lastTicketNumber}'),
          ),
          OutlinedButton.icon(
            onPressed: () { 
              // print  ('Nuevo Ticket');
              // context.go('/dashboard/public');
              ref.read(newTicketProvider.notifier).createTicket();
            }, 
            label: const Text('Nuevo Ticket'), 
            icon: const Icon(Icons.add)
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //   //? CAMPO NÚMERO DE CLIENTE
          //   Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 0),
          //     child: Text(
          //       'Número de Ticket',
          //       style: GoogleFonts.poppins(
          //         fontSize: 12.5,
          //         fontWeight: FontWeight.bold,
          //         color: Color(0xFF293277),
          //       ),
          //     ),
          //   ),
          //   CustomInput(
          //     controller: controller,
          //     icon: Padding(
          //       padding: const EdgeInsets.only(left: 10, right: 0),
          //       child: const Icon(
          //         Icons.receipt,
          //         color: Color(0xff293277),
          //         size: 20,
          //       ),
          //     ),
          //     hint: 'Ingrese Número de Ticket',
          //     width: 300,

          //     // placeholder: 'Buscar Ticket',
          //     // onChanged: (value) => ref.read(newTicketProvider.notifier).searchTicket(value)
          //   )
          // ])
        ]
      )
    );
  }
}