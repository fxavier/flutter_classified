import 'package:flutter/material.dart';
import 'package:flutter_classified/screens/screens.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  runApp(const MyApp());
}

Future<void> initializeParse() async {
  await dotenv.load(fileName: ".env");
  final keyApplicationId = dotenv.env['KEY_APPLICATION_ID'];
  final keyParseClientKey = dotenv.env['KEY_CLIENT_KEY'];
  final keyParseServerUrl = dotenv.env['KEY_PARSE_SERVER_URL'];
  await Parse().initialize(keyApplicationId!, keyParseServerUrl!,
      clientKey: keyParseClientKey,
      debug: true,
      autoSendSessionId: true,
      coreStore: CoreStoreMemoryImp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Classified',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BaseScreen(),
    );
  }
}
