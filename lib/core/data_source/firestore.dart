import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'authentication.dart';

///Global Firestore instance
final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

///Valid access to DB (User signed in)
final databaseProvider = Provider<Database?>((ref) {
  final firestore = ref.watch(firestoreProvider);
  final auth = ref.watch(authStateChangesProvider);

  ///We only have a valid DB if the user is signed in
  if (auth.asData?.value?.uid != null) {
    return Database(uid: auth.asData!.value!.uid, firestore: firestore);
  }
  // Otherwise we return null, auto-dispose is called in other providers automatically
  return null;
});

class Database {
  final String uid;
  final FirebaseFirestore firestore;
  Database({required this.uid, required this.firestore});
}
