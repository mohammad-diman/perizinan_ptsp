import 'package:b/client/apiclient.dart';
import 'package:b/client/token_manager.dart';
import 'package:b/exception/login_exception.dart';
import 'package:dio/dio.dart';

import '../../exception/register_exception.dart';

class AuthService {
  final Dio _dio = Dio();
  late final ApiClient _client = ApiClient(_dio);
  final TokenManager _tokenManager = TokenManager();

  static AuthService? _authService;

  AuthService._privateConstructor();

  static AuthService getInstance() {
    _authService ??= AuthService._privateConstructor();
    return _authService!;
  }

  Future<bool> login(String username, String password) async {
    try {
      final response = await _client.login(username, password);

      await _tokenManager.saveToken(response.token ?? "");

      return true;
    } on DioException catch (e) {
      if (e.response != null) {
        final errorData = e.response?.data;
        if (errorData is Map<String, dynamic>) {
          if (errorData.containsKey('errors')) {
            final errors = errorData['errors'];
            throw LoginException(errors);
          } else if (errorData.containsKey('error')) {
            throw LoginException({'error': errorData['error']});
          }
        }
      } else {
        throw LoginException(
            const MapEntry('error', '') as Map<String, dynamic>);
      }
    }
    return false;
  }

  Future<bool> register(String username, String password,
      String konfirmasi_password) async {
    try {
      final response = await _client.register(
          username, password, konfirmasi_password);

      await _tokenManager.saveToken(response.token ?? "");

      return true;
    } on DioException catch (e) {
      if (e.response != null) {
        final errorData = e.response?.data;
        if (errorData is Map<String, dynamic>) {
          if (errorData.containsKey('errors')) {
            final errors = errorData['errors'];
            throw RegisterException(errors);
          } else if (errorData.containsKey('error')) {
            throw RegisterException({'error': errorData['error']});
          }
        }
      } else {
        throw RegisterException(
            const MapEntry('error', '') as Map<String, dynamic>);
      }
    }
    return false;
  }
}