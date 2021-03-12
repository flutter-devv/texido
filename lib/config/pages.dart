import 'package:get/get.dart';
import '../views/auth/forgot_password.dart';
import '../views/auth/sign_in.dart';
import '../views/home/home.dart';
import '../views/qr/qr_scanning/qr_scanning.dart';
import '../views/qr/qr_verified/qr_verified.dart';
import '../views/splash/splash.dart';
import 'routes.dart';

class AppPages {
  List<GetPage> getPages() {
    return [
      GetPage(
        name: Routes.splash,
        page: () => Splash(),
      ),
      GetPage(
        name: Routes.signIn,
        page: () => SignIn(),
      ),
      GetPage(
        name: Routes.home,
        page: () => HomeScreen(),
      ),
      GetPage(
        name: Routes.barScan,
        page: () => QRScanning(),
      ),
      GetPage(
        name: Routes.qrVerified,
        page: () => QRVerified(),
      ),
      GetPage(
        name: Routes.forgotPassword,
        page: () => ForgotPassword(),
      ),
    ];
  }
}
