import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Global Firebase auth instance
final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

///User auth state
final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(firebaseAuthProvider).authStateChanges());

///Auth data source
final authDataSource =
    Provider((ref) => AuthDatasource(ref.watch(firebaseAuthProvider)));

class AuthDatasource {
  FirebaseAuth auth;
  AuthDatasource(this.auth);

  Future<void> signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } on FirebaseException catch (e, stack) {
      throw ("Failed to sign in");
    }
  }
}
