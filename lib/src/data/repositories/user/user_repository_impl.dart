import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_example/src/data/repositories/user/user_repository.dart';
import 'package:flutter_app_example/src/domain/models/user_model.dart';

class UserRepositoryImpl extends UserRepository {
  final firestoreUserData = FirebaseFirestore.instance.collection('userData');

  @override
  Future<UserModel> getUserData() => firestoreUserData
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((data) => UserModel.fromJson(data.data())..id = data.id);

  @override
  Stream<UserModel> streamUserData() => firestoreUserData
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots()
      .map((data) => UserModel.fromJson(data)..id = data.id);

  @override
  Future<void> updateUser(UserModel user) async {
    firestoreUserData.doc(FirebaseAuth.instance.currentUser!.uid).set(user.toJson());
  }
}
