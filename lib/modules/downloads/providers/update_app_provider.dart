import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/shared/api/providers/apiApp_provider.dart';

class UpdateAppProvider extends Notifier<UpdateAppState>{

  @override
  UpdateAppState build() {
    return UpdateAppState(version: '', oldVersion: '');
  }

  void getVersion() async {
    
    try{

      // TODO: El BACKEND IMPLEMENTA API PARA CONSULTAR VERSIÓN DE FLUTTER
      final apiApp = ref.read(apiAppProvider);
      final response = await apiApp.get('/last');
      print(response);
      state = state.copyWith(
        version: response.data,
      );
      
    }
    catch(e){
      return;
    }

  }

}

class UpdateAppState {

  final String version;
  final String oldVersion;


  UpdateAppState({required this.version, required this.oldVersion});

  UpdateAppState copyWith({
    String? version,
    String? oldVersion
  }) {
    return UpdateAppState(
      version: version ?? this.version,
      oldVersion: oldVersion ?? this.oldVersion 
    );
  }

}