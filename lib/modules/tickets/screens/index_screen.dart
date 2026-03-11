import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template_flutter_test/modules/tickets/providers/index_component_provider.dart';
import 'package:template_flutter_test/shared/widgets/input/custom_input.dart';

class IndexScreen extends ConsumerStatefulWidget {
  const IndexScreen({super.key});

  @override
  ConsumerState<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends ConsumerState<IndexScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ticketProvider = ref.watch(indexComponentProvider).ticketOnProcess;

    // print  ('ticketProvider: $ticketProvider');

    return RefreshIndicator(
      onRefresh: () => ref.read(indexComponentProvider.notifier).getTicketWorking(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          spacing: 20,
          children: [
            Center(
              child: Text(
                'Programa de Colas',
                style: const TextStyle(fontSize: 20),
              ),
            ),
      
            ticketProvider.isNotEmpty
                ? Column(
                    children: [
                      for (final e in ticketProvider)
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          color: Color(0xFFE7E9FB),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 5,
                            children: [
                              Center(
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Ticket ${e.number}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Escritorio ${e.handleAtDesk} ',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'ID: ${e.id} ',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  )
                // ListView.builder(
                //     itemCount: ticketProvider.length,
                //     itemBuilder: (context, index) {
                //       final e = ticketProvider[index];
                //       return Container(
                //       width: double.infinity,
                //       padding: const EdgeInsets.all(8),
                //       color: Color(0xFFE7E9FB),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         spacing: 5,
                //         children: [
                //           Center(
                //             child: RichText(
                //               text: TextSpan(
                //                 text: 'Ticket ${e.number}',
                //                 style: GoogleFonts.poppins(
                //                   fontSize: 20,
                //                   fontWeight: FontWeight.bold,
                //                   color: Colors.black,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           RichText(
                //             text: TextSpan(
                //               text: 'Escritorio ${e.handleAtDesk} ',
                //               style: GoogleFonts.poppins(
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.normal,
                //                 color: Colors.black,
                //               ),
                //             ),
                //           ),
                //           RichText(
                //             text: TextSpan(
                //               text: 'ID: ${e.id} ',
                //               style: GoogleFonts.poppins(
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.normal,
                //                 color: Colors.black,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     );
                //     },
                //   )
                : Container(
                    height: 50,
                    color: Color(0xFFE7E9FB),
                    child: Center(
                      child: Text(
                        'No hay tickets en proceso',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
      
            Divider(color: Color(0xFFDDDDDD)),
      
            Center(
              child: Text(
                'Ingrese Escritorio para atender un ticket',
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //? CAMPO NÚMERO DE CLIENTE
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Text(
                    'Número de Escritorio',
                    style: GoogleFonts.poppins(
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF293277),
                    ),
                  ),
                ),
                CustomInput(
                  controller: controller,
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 0),
                    child: const Icon(
                      Icons.desktop_mac_outlined,
                      color: Color(0xff293277),
                      size: 20,
                    ),
                  ),
                  hint: 'Ingrese Escritorio',
                  width: 300,
                ),
              ],
            ),
            OutlinedButton.icon(
              onPressed: () {
                // print  ('Desk');
                context.goNamed(
                  'desk',
                  pathParameters: {'id_desk': controller.text},
                );
              },
              label: const Text('Ingresar Escritorio'),
              icon: const Icon(Icons.download),
            ),
            OutlinedButton.icon(
              onPressed: () {
                ref.read(indexComponentProvider.notifier).deleteTickets();
              },
              label: const Text('Eliminar Tickets'),
              icon: const Icon(Icons.delete),
            ),
            // ListView.builder(
            //   itemBuilder: ,
            // )
          ],
        ),
      ),
    );
  }
}
