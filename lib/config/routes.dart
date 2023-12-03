import 'package:veegil_bank_app_test/src/routes.dart';

class RouteGenerator {
  static const String splashPage = 'splashPage';
  static const String onboardingPage = 'onboardingPage';
  static const String loginPage = 'loginPage';
  static const String registerPage = 'registerPage';
  static const String navigationPage = 'navigationPage';
  static const String notificationPage = 'notificationPage';
  static const String transferPage = 'transferPage';
  static const String transferToFriendsPage = 'transferToFriendsPage';
  static const String transferSuccessfulPage = 'transferSuccessfulPage';
  static const String transferBankPage = 'transferBankPage';
  static const String withdrawPage = 'withdrawPage';
  static const String withdrawCodePage = 'withdrawCodePage';
  static const String paymentPage = 'paymentPage';
  static const String addNewAccountPage = 'addNewAccountPage';
  static const String addCardPage = 'addCardPage';
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
      case transferToFriendsPage:
        return MaterialPageRoute(builder: (_) => const TransferToFriendsPage());
      case transferSuccessfulPage:
        return MaterialPageRoute(
            builder: (_) => const TransferSuccessfulPage());
      case transferBankPage:
        return MaterialPageRoute(builder: (_) => const TransferBankPage());
      case withdrawPage:
        return MaterialPageRoute(builder: (_) => const WithdrawPage());
      case withdrawCodePage:
        return MaterialPageRoute(builder: (_) => const WithdrawCodePage());
      case paymentPage:
        return MaterialPageRoute(builder: (_) => const PaymentPage());
      case addNewAccountPage:
        return MaterialPageRoute(builder: (_) => const AddNewAccountPage());
          case addCardPage:
        return MaterialPageRoute(builder: (_) => AddCardPage());
      case manageNotificationPage:
        return MaterialPageRoute(
            builder: (_) => const ManageNotificationPage());


      case registerSuccessPage:
        return MaterialPageRoute(builder: (_) => const RegisterSuccessPage());

      default:
        throw Exception('Route not found');
    }
  }
}