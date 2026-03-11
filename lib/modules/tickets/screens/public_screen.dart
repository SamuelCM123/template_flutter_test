import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template_flutter_test/modules/tickets/providers/public_provider.dart';

class PublicScreen extends ConsumerStatefulWidget {
  const PublicScreen({super.key});

  @override
  ConsumerState<PublicScreen> createState() => _PublicScreenState();
}

class _PublicScreenState extends ConsumerState<PublicScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ticketProvider = ref.watch(publicProvider).ticketsPending;

    return RefreshIndicator(
      onRefresh: () => ref.read(publicProvider.notifier).getTicketWorking(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO: Implementar los tickets en los que se estan trabajando
            Center(
              child: Text(
                'Tickets en Proceso',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            ticketProvider!.isNotEmpty
                ? Container(
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
                              text: 'Ticket ${ticketProvider.first.number}',
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
                            text:
                                'Escritorio ${ticketProvider.first.handleAtDesk} ',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'ID: ${ticketProvider.first.id} ',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                  color: Color(0xFFE7E9FB),
                  height: 50,
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
        
            SizedBox(height: 20),
        
            Center(
              child: Text(
                'Tickets en Pendientes',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            ticketProvider.isNotEmpty
                ? Column(
                    children: [
                      for (final e in ticketProvider.skip(1))
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
                : Container(
                  color: Color(0xFFE7E9FB),
                  height: 50,
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
            // ...ticketProvider.sublist(1, ticketProvider.length).map((e) {
            //   return Container(
            //     width: doublticketProvider.first.infinity,
            //     padding: const EdgeInsets.all(8),
            //     color: Color(0xFFE7E9FB),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       spacing: 5,
            //       children: [
            //         Center(
            //           child: RichText(
            //             text: TextSpan(
            //               text: 'Ticket ${e.number}',
            //               style: GoogleFonts.poppins(
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.black,
            //               ),
            //             ),
            //           ),
            //         ),
            //         RichText(
            //           text: TextSpan(
            //             text: 'Escritorio ${e.handleAtDesk} ',
            //             style: GoogleFonts.poppins(
            //               fontSize: 16,
            //               fontWeight: FontWeight.normal,
            //               color: Colors.black,
            //             ),
            //           ),
            //         ),
            //         RichText(
            //           text: TextSpan(
            //             text: 'ID: ${e.id} ',
            //             style: GoogleFonts.poppins(
            //               fontSize: 16,
            //               fontWeight: FontWeight.normal,
            //               color: Colors.black,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   );
            // }),
          ],
        ),
      ),
    );
  }
}
