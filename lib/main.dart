import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:veegil_bank_app_test/src/main.dart';
import 'package:veegil_bank_app_test/utils/providerSetUp.dart';

import 'data/auth/auth_request.dart';
import 'data/local_database.dart/local_db.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(HiveKeys.appBox);
  _initializeHiveStorage();
  runApp(const MyApp());
}

Future<void> _initializeHiveStorage() async {
   HiveStorage(await Hive.openBox(HiveKeys.appBox));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context,child)=>MultiProvider(
      providers:providers,
      child: MaterialApp(
        title: 'Wallet App',
        theme: ThemeData(
          primarySwatch: Palette.primaryPaletteColor,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: primaryColor,
            selectionColor: primaryColor,
            selectionHandleColor: primaryColor,
          ),
        ),
        //themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        initialRoute: RouteGenerator.splashPage,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    ),
    );
  }
}