
import 'package:grocery_store/src/constants/endpoints.dart';
import 'package:grocery_store/src/models/user_model.dart';
import 'package:grocery_store/src/services/http_manager.dart';

class AuthRepository {

  final HttpManager _httpManager = HttpManager();

  Future signIn({
    required String email,
    required String password
  }) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.signIn,
        method: HttpMethods.post,
        body: {
          "email": email,
          "password": password
        },
    );
    if(result['result']!= null) {
      print('deu bom');
      final user = UserModel.fromJson(result['result']);
    } else {
      print('deu ruim');
    }
    return result;
  }
}