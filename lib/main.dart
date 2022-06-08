import 'package:big_toe_mobile/services/notification.service.dart';
import 'package:big_toe_mobile/services/prompt.service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

import 'firebase_options.dart';
import 'home/home.dart';
import 'services/game.service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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

  GetIt.I.registerSingleton<PromptService>(
      PromptService(FirebaseFirestore.instance));
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
