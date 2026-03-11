import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/modules/tickets/providers/desk_provider.dart';

class Desk extends ConsumerStatefulWidget {
  final String id_desk;

  Desk({super.key, required this.id_desk});

  @override
  ConsumerState<Desk> createState() => _DeskState();
}

class _DeskState extends ConsumerState<Desk> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  final deskProv = ref.watch(deskProvider);
  
    return SingleChildScrollView(
      child: Stack(
        children: [
          SizedBox(
            height: 50,
            width: 150,
            child: Center(
              child: OutlinedButton.icon(
                onPressed: () {
                  // print  ('Nuevo Ticket');
                  context.goNamed('index-component');
                },
                label: Text('Regresar', softWrap: false),
                icon: Icon(Icons.arrow_back),
              ),
            ),
          ),
          Column(
            // spacing: 10,
            children: [
              SizedBox(height: 50),
              Text(
                'Escritorio ${widget.id_desk}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF293277),
                ),
              ),
              Divider(color: Color(0xFFDDDDDD)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Atendiendo a ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF293277),
                              ),
                            ),
                            TextSpan(
                              text:
                                  deskProv.ticketWorking == null ?  '...' : deskProv.ticketWorking!.number.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF293277),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 170,
                        child: OutlinedButton(
                          onPressed: () {
                            // print  ('Nuevo Ticket');
                            ref.read(deskProvider.notifier).nextTicket(int.parse(widget.id_desk));
                          },
                          child: Text('Atender Siguiente', softWrap: false),
                        ),
                      ),
                      SizedBox(
                        width: 170,
                        child: OutlinedButton(
                          onPressed: () {
                            // print  ('Nuevo Ticket');
                            // context.go('/dashboard/public');
                            ref.read(deskProvider.notifier).finishTicket(int.parse(widget.id_desk));
                          },
                          child: const Text('Terminar'),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    spacing: 10,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'En Cola',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF293277),
                              ),
                            ),
                          ],
                        ),
                      ),
                      deskProv.ticketPending == 0 ?
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusGeometry.circular(10),
                            color: Color.fromRGBO(221, 221, 221, .25),
                            border: BoxBorder.all(color: Color(0xFFDDDDDD)),
                          ),
                          width: 150,
                          height: 50,
                          child: Text(
                            'Sin tickets en cola',
                            style: TextStyle(fontSize: 14),
                          ),
                          // color: Color(0xFFDDDDDD),
                        )
                      : RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: deskProv.ticketPending.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF293277),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(children: [
        
              ],
            ),
            ],
          ),
        ],
      ),
    );
  }
}
