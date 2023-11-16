import 'package:get/get.dart';
import 'package:grocery_store/src/constants/storage_keys.dart';
import 'package:grocery_store/src/models/app_data.dart';
import 'package:grocery_store/src/models/user_model.dart';
import 'package:grocery_store/src/pages/auth/repository/auth_repository.dart';
import 'package:grocery_store/src/pages/auth/result/auth_result.dart';
import 'package:grocery_store/src/routes/app_pages.dart';
import 'package:grocery_store/src/services/utils_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final AuthRepository _authRepository = AuthRepository();
  final UtilsServices utilsServices = UtilsServices();

  UserModel userModel = UserModel();

  @override
  void onInit(){
    super.onInit();

    validateToken();
  }

  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;

    AuthResult result =
        await _authRepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(success: (user) {
      userModel = user;
      saveToken();
    }, error: (message) {
      utilsServices.showToast(message: message, isError: true);
    });
  }

  Future<void> validateToken() async {
    String? token = await utilsServices.getLocalData(key: StorageKeys.token);
    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }
    AuthResult result = await _authRepository.validateToken(token);

    result.when(success: (user) {
      userModel = user;

      saveToken();
    }, error: (message) {
      signOut();
    });
  }

  void saveToken() {
    utilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);

    Get.offAllNamed(PagesRoutes.baseRoute);
  }

  Future<void> signOut() async {

    userModel = UserModel();

    await utilsServices.removeLocalData(key: StorageKeys.token);

    Get.offAllNamed(PagesRoutes.signInRoute);

  }
}
