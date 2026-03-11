import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_flutter_test/shared/helpers/download/auto_update_apk.dart';

class UpdateAppScreen extends ConsumerStatefulWidget {

  const UpdateAppScreen({super.key});

  @override
  ConsumerState<UpdateAppScreen> createState() => _UpdateAppScreenState();
}

class _UpdateAppScreenState extends ConsumerState<UpdateAppScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Text('Módulo para actualizar la app'),
          ),
          OutlinedButton.icon(
            onPressed: () { 
              AutoUpdateService().checkForUpdate();
            }, 
            label: const Text('Descarga APK'), 
            icon: const Icon(Icons.download)
          ),
        ]
      )
    );
  }

}