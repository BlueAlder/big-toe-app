import 'package:big_toe_mobile/src/services/auth.service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';
import 'src/home/home.dart';
import 'src/services/game.service.dart';
import 'src/services/firestore.service.dart';
import 'src/services/notification.service.dart';
import 'src/services/prompt.service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  registerServices();
  runApp(const MyApp());
}

void registerServices() {
  const bool useEmulator = false;

  if (useEmulator) {
    FirebaseFirestore.instance.settings = const Settings(
      host: '10.0.2.2:8080',
      sslEnabled: false,
      persistenceEnabled: false,
    );
  }

  GetIt.I.registerSingleton(FirestoreService());
  GetIt.I.registerSingleton(AuthService());
  GetIt.I.registerSingleton<PromptService>(PromptService());
  GetIt.I.registerSingleton<GameService>(GameService());
  GetIt.I.registerSingleton<NotificationService>(NotificationService());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Big Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
