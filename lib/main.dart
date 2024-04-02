import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseproject/App.dart';
import 'package:firebaseproject/firebase_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const FirestoreDatabase(), // Wrap your app
    ),
  );
}