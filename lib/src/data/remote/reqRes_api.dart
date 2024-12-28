import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:todolist_app/src/models/auth_login_model.dart';

part 'reqRes_api.g.dart';

@RestApi()
abstract class ReqResApiClient {
  factory ReqResApiClient(Dio dio, {String baseUrl}) = _ReqResApiClient;

  @POST('/login')
  Future<AuthLoginModel> login({
    @Field("email") required String email,
    @Field("password") required String password,
  });
}
