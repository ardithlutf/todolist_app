import 'package:todolist_app/src/data/remote/reqRes_api.dart';
import 'package:todolist_app/src/data/repo/repo.dart';
import 'package:todolist_app/src/handler/exception_handler.dart';
import 'package:todolist_app/src/models/auth_login_model.dart';

class ReqResRepositoryImpl implements ReqResRepository {
  ReqResRepositoryImpl({
    required ReqResApiClient reqResApiClient,
  }) : _reqResApiClient = reqResApiClient;

  late final ReqResApiClient _reqResApiClient;

  /// Remote
  @override
  Future<AuthLoginModel> login(
      {required String email, required String password}) async {
    return await _reqResApiClient
        .login(email: email, password: password)
        .catchError(ExceptionHandler.handleException);
  }
}
