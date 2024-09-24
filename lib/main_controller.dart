import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notlarim/presentation/auth/login/login_page.dart';
import 'package:notlarim/presentation/storage/allNotes/all_notes_page.dart';

class MainController  extends ChangeNotifier {
  Widget firstPage = const AllNotesPage();

  void checkUserSignedIn() {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        firstPage = const LoginPage();
        notifyListeners();
      } else{
        if (user.emailVerified) {
          firstPage = const AllNotesPage();
        } else {
          firstPage = const LoginPage();
        }
        notifyListeners();
      }
    });
  }
}