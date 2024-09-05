import 'package:b/model/authresponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'apiclient.g.dart';

@RestApi(baseUrl: "http://10.35.31.173:8000/api")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/auth/login")
  Future<AuthResponse> login(
      @Field("username") String username, @Field("password") String password);
}
