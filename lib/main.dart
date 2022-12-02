import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}
// runApp(MaterialApp(
//       home: HomePage(),
//     ));
