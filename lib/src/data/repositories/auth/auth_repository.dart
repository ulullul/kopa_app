import 'package:flutter_app_example/src/core/data/base_repository.dart';
import 'package:flutter_app_example/src/domain/models/user_model.dart';

abstract class AuthRepository extends BaseRepository {
  Future<void> createUser(UserModel user);
}
