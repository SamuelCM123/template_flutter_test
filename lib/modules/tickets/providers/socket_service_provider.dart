
import 'dart:async';
import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/shared/helpers/encrypt/encrypt.dart';
import 'package:template_flutter_test/shared/socket/socket_instance.dart';

final workingOnTicketStream = StreamProvider.autoDispose<List<Ticket>>((ref){

  final socket = SocketInstance().socket;

  final controller = StreamController<List<Ticket>>();

  void handleTicketUpdate(dynamic data) {
    try{
      
      if(data is String){
        print('data socket:$data');
        // final decryptor = EncryptService(modeEncrypt: EncryptMode.gcm).decrypt(data);
        final decryptor = ref.read(encryptServiceProvider).decrypt(data);
        print('decryptor:$decryptor');
        final List<dynamic> dataList = jsonDecode(decryptor);

        // print('dataList:$dataList');
        final tickets = dataList.map((e) => Ticket.fromJson(e)).toList();

        if(!controller.isClosed){
          controller.add(tickets);
        }
      }
    }
    catch(e,stack){
      print  ('Error:$e');
      controller.addError(e, stack);
    }
  }

  socket?.on('on-working-on-ticket', handleTicketUpdate);

  ref.onDispose(() {
    socket?.off('on-working-on-ticket', handleTicketUpdate);
    controller.close();
  });

  return controller.stream;
});

class Ticket {
  final String id;
  final int number;
  final String createdAt;
  final String handleAtDesk;
  final String handleAt;
  final bool done;

  Ticket({
    required this.id,
    required this.number,
    required this.createdAt,
    required this.done, 
    required this.handleAtDesk,
    required this.handleAt
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'],
      number: json['number'],
      createdAt: json['created_at'],
      done: json['done'], 
      handleAtDesk: json['handleAtDesk'] ?? '',
      handleAt: json['handleAt'] ?? '',
    );
  }
}