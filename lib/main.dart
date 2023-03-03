import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Details App',
      home: HomePage(),
    );
  }
}
