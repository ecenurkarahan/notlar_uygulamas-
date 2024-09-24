import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AllNotesPageController extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference notesCollection = FirebaseFirestore.instance.collection('notes');
  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> fetchNotes() async {}

}