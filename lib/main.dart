import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notlarim/presentation/auth/login/login_page.dart';
import 'package:notlarim/presentation/auth/signup/signup_page.dart';
import 'package:notlarim/presentation/storage/addNote/add_note_page.dart';
import 'package:notlarim/presentation/storage/allNotes/all_notes_page.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'main_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return MainController()..checkUserSignedIn();
      },
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/allNotes': (context) => const AllNotesPage(),
        'addNote': (context) => const AddNotePage(),
      },
      home: Consumer(
        builder: (context, MainController mainController, child) {
          return mainController.firstPage;
        },
      ),
    );
  }
}