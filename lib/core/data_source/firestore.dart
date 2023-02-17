import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'authentication.dart';

///Global Firestore instance
final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);
