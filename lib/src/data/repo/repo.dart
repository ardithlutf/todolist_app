import 'package:todolist_app/src/models/auth_login_model.dart';

abstract class ReqResRepository {
  /// Remote
  Future<AuthLoginModel> login(
      {required String email, required String password});
}
