import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/router/app_router.dart';
import 'package:template_flutter_test/shared/socket/socket_instance.dart';
import 'package:template_flutter_test/shared/socket/socket_instance_pure.dart';
// import 'package:template_flutter_test/shared/constants/env/env_config.dart';
// import 'package:template_flutter_test/shared/socket/socket_instance.dart';

void main() async {

  //? Asegurarse de que Flutter esté completamente inicializado antes de ejecutar la aplicación
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Inicializar router

  //? Cargar variables de entorno
  await dotenv.load(fileName: '.env');

  //? Inicializar Socket Puro
  // SocketInstancePure().connect();
  
  //? Inicializar Socket IO
  SocketInstance().connect();

  //? Ejecutar la aplicación
  runApp(
    const ProviderScope(
      child: MyApp(),
    )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    
    final appRouter = ref.watch(routerProvider);
    
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsetsGeometry.all(0),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
    );
  }
}
