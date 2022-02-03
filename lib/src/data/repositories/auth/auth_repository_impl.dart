import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_example/src/data/repositories/auth/auth_repository.dart';
import 'package:flutter_app_example/src/domain/models/user_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  final firestoreUserData = FirebaseFirestore.instance.collection('userData');

  @override
  Future<void> createUser(UserModel user) async {
    firestoreUserData.doc(user.id).set(user.toJson());
  }
}
