import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/shared/socket/socket_instance.dart';

final ticketCountProvider = StreamProvider.autoDispose<int>((ref) {

  final socket = SocketInstance().socket;
  final controller = StreamController<int>();

  void handler(dynamic data) {
    if (data is int && !controller.isClosed) {
      controller.add(data);
    }
  }

  socket?.on('on-ticket-count-changed', handler);

  ref.onDispose(() {
    socket?.off('on-ticket-count-changed', handler);
    controller.close();
  });

  return controller.stream;
});