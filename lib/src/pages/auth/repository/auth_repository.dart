import 'package:grocery_store/src/constants/endpoints.dart';
import 'package:grocery_store/src/models/user_model.dart';
import 'package:grocery_store/src/pages/auth/result/auth_errors.dart'
    as authErrors;
import 'package:grocery_store/src/pages/auth/result/auth_result.dart';
import 'package:grocery_store/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future<AuthResult> signIn(
      {required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signIn,
      method: HttpMethods.post,
      body: {"email": email, "password": password},
    );
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);

      return AuthResult.success(user);
    } else {
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  }

  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.validToken,
        method: HttpMethods.post,
        headers: {'X-Parse-Session-Token': token}
    );

    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);

      return AuthResult.success(user);
    } else {
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  }
}
