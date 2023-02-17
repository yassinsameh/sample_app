import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innoscripta_demo/core/errors/messages.dart';

import '../core/data_source/firestore.dart';
import 'models/task.dart';

final tasksDataSourceProvider = Provider.autoDispose((ref) {
  final database = ref.watch(databaseProvider)!;
  return TasksDataSource(database, ref);
});

class TasksDataSource {
  final Database db;
  final Ref ref;

  static const collectionPath = 'tasks';

  TasksDataSource(this.db, this.ref);

  Stream<QuerySnapshot<Map<String, dynamic>>> watchUserTasks() {
    try {
      return db.firestore
          .collection(collectionPath)
          .where("created_by", isEqualTo: db.uid)
          .snapshots();
    } on FirebaseException catch (e, stack) {
      throw (e.message ?? ErrorMessages.genericError);
    }
  }

  Future<void> updateTask({required Task task}) async {
    try {
      await db.firestore
          .collection(collectionPath)
          .doc(task.id)
          .update(task.toJson());
    } catch (e) {
      throw (ErrorMessages.failedToUpdateTask);
    }
  }

  Future<void> addTask({required Task task}) async {
    try {
      task = task.copyWith(createdBy: db.uid);
      await db.firestore.collection(collectionPath).add(task.toJson());
    } on FirebaseException catch (e) {
      throw (e.message ?? ErrorMessages.failedToUpdateTask);
    } catch (e) {
      throw (ErrorMessages.failedToUpdateTask);
    }
  }

  Future<void> deleteTask({required String id}) async {
    try {
      await db.firestore.collection(collectionPath).doc(id).delete();
    } on FirebaseException catch (e) {
      throw (e.message ?? ErrorMessages.failedToUpdateTask);
    } catch (e) {
      throw (ErrorMessages.failedToUpdateTask);
    }
  }
}
