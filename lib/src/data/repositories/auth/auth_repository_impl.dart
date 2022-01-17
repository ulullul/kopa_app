import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_example/src/data/repositories/auth/auth_repository.dart';
import 'package:flutter_app_example/src/domain/models/user_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  final firestoreUserData = FirebaseFirestore.instance.collection('userData');

  @override
  Future<void> createUser(User user) async {
    firestoreUserData.doc(user.uid).set(UserModel(
            id: user.uid,
            firstName: 'firstName',
            lastName: 'lastName',
            phone: user.phoneNumber)
        .toJson());
  }
}
