import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_flutter_test/modules/tickets/providers/socket_service_provider.dart';
import 'package:template_flutter_test/shared/socket/socket_instance_pure.dart';

final socketStreamPureProvider = StreamProvider.autoDispose<List<Ticket>>((ref) {
  
  final instance = SocketInstancePure();
  
  // Aseguramos conexión
  instance.connect();

  // El stream de ws puro devuelve strings, hay que parsearlos
  return instance.stream.map((rawData) {
    // print  ('rawData: $rawData');
    final Map<String, dynamic> data = jsonDecode(rawData);
    
    // Si tu servidor TS envía algo como { "event": "tickets", "data": [...] }
    if (data['type'] == 'on-working-on-ticket') {
      final List<dynamic> list = data['payload'];
      return list.map((e) => Ticket.fromJson(e)).toList();
    }
    
    return <Ticket>[]; // O manejar otros eventos
  });
});