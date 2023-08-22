import 'package:get/get.dart';
import 'package:grocery_store/src/pages/auth/view/sign_in_screen.dart';
import 'package:grocery_store/src/pages/auth/view/sign_up_screen.dart';
import 'package:grocery_store/src/pages/base/base_screen.dart';
import 'package:grocery_store/src/pages/splash/splash_screen.dart';

abstract class AppPages{
  static final pages = <GetPage>[
    GetPage(
        name: PagesRoutes.splashRoute,
        page: () => const SplashScreen()
    ),
    GetPage(
        name: PagesRoutes.signInRoute,
        page: () => SignInScreen()
    ),
    GetPage(
        name: PagesRoutes.signUpRoute,
        page: () => SignUpScreen()
    ),
    GetPage(
        name: PagesRoutes.baseRoute,
        page: () => const BaseScreen()
    )
  ];
}

abstract class PagesRoutes{
  static const String splashRoute = '/splash';
  static const String signInRoute = '/signIn';
  static const String signUpRoute = '/signUp';
  static const String baseRoute = '/';
}