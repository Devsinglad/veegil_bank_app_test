import 'package:veegil_bank_app_test/src/routes.dart';

class RouteGenerator {
  static const String splashPage = 'splashPage';
  static const String onboardingPage = 'onboardingPage';
  static const String loginPage = 'loginPage';
  static const String registerPage = 'registerPage';
  static const String navigationPage = 'navigationPage';
  static const String withDrawSuccessPage = 'withDrawSuccessPage';
  static const String notificationPage = 'notificationPage';
  static const String transferPage = 'transferPage';
  static const String transferBankPage = 'transferBankPage';
  static const String withdrawPage = 'withdrawPage';
  static const String manageNotificationPage = 'manageNotificationPage';
  static const String registerSuccessPage = 'registerSuccessPage';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case onboardingPage:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case registerPage:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case navigationPage:
        return MaterialPageRoute(builder: (_) => const NavigationPage());
      case notificationPage:
        return MaterialPageRoute(builder: (_) => const NotificationPage());
      case transferPage:
        return MaterialPageRoute(builder: (_) => const TransferPage());
      case transferBankPage:
        return MaterialPageRoute(builder: (_) => const TransferBankPage());
      case withdrawPage:
        return MaterialPageRoute(builder: (_) => const WithdrawPage());
      case manageNotificationPage:
        return MaterialPageRoute(
            builder: (_) => const ManageNotificationPage());
      case registerSuccessPage:
        return MaterialPageRoute(builder: (_) => const RegisterSuccessPage());
      case withDrawSuccessPage:
        return MaterialPageRoute(builder: (_) => const WithDrawSuccess());
      default:
        throw Exception('Route not found');
    }
  }
}