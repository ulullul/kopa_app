import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_example/src/core/data/base_repository.dart';
import 'package:get/get.dart';

abstract class AuthRepository extends BaseRepository {
  Future<void> createUser(User user);
}
