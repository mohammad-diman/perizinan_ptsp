import 'package:b/flavor/config_dev.dart';
import 'package:b/model/authresponse.dart';
import 'package:b/model/item_models.dart';
import 'package:b/model/jenis_perizinan.dart';
import 'package:b/model/user_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'apiclient.g.dart';

@RestApi(baseUrl: Config.perizinanPTSPBaseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST("/auth/login")
  Future<AuthResponse> login(
      @Field("username") String username,
      @Field("password") String password);

  @POST("/auth/register")
  Future<AuthResponse> register(
      @Field("username") String username,
      @Field("password") String password,
      @Field("konfirmasi_password") String konfirmasi_password);

  @GET("/auth/me")
  Future<UserDto> me(
      @Header("Authorization") String Token
      );
}
