import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../data/auth/auth_request.dart';
import '../data/transactions/transaction_get_request.dart';
import '../data/transactions/transaction_post_request.dart';
import '../providers/confirm_password_provider.dart';
import '../providers/date_provider.dart';
import '../providers/password_provider.dart';


List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => PasswordProvider()),
  ChangeNotifierProvider(create: (_) => ConfirmPasswordProvider()),
  ChangeNotifierProvider(create: (_) => DateProvider()),
  ChangeNotifierProvider(create: (_) => AuthApi()),
  ChangeNotifierProvider(create: (_) => TransactionGetApi()),
  ChangeNotifierProvider(create: (_) => TransactionPostApi()),
];