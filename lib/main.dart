import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:veegil_bank_app_test/src/main.dart';
import 'package:veegil_bank_app_test/utils/helper.dart';
import 'package:veegil_bank_app_test/utils/providerSetUp.dart';

import 'data/local_database.dart/local_db.dart';
BuildContext? overlayContext;
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(HiveKeys.appBox);
  _initializeHiveStorage();
  runApp( MyApp());
}

Future<void> _initializeHiveStorage() async {
   HiveStorage(await Hive.openBox(HiveKeys.appBox));
}



class MyApp extends StatelessWidget {
  final ToastService2 toastService = ToastService2();

   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context,child){
        toastService.overlayKey = GlobalKey<OverlayState>();

        return MultiProvider(
          providers:providers,
          child: MaterialApp(
            key: navigatorKey,
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
        );
      }
    );
  }
}