import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:my_widgets/platform_channel_util.dart';

import 'package:simple_internet_checker/src/screen/connectivity_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'screens/home_screen.dart';

void main() async {
  Stripe.publishableKey = "your key";
  WidgetsFlutterBinding.ensureInitialized();
  await AppScreenPrivacyService().enableScreenPrivacy();

  runApp(const ProviderScope(child: MyApp()));
}

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return ConnectivityScreen(
          child: MaterialApp(
            theme: ThemeData(useMaterial3: true),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            builder: (context, child) => ResponsiveBreakpoints(
              breakpoints: const [
                Breakpoint(start: 0, end: 450, name: MOBILE),
                Breakpoint(start: 451, end: 800, name: TABLET),
                Breakpoint(start: 801, end: 1920, name: DESKTOP),
                Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
              child: child!,
            ),
            home: const HomeScreen(),
            scaffoldMessengerKey: messengerKey,
          ),
          // ),
        );
      },
    );
  }

  //THIS CODE IS FOR IN-APP-UPDATE
  // CALL THIS ON INIT METHOD AND THE APP SHOULD BE AVAILABLE IN PLAYSTORE AND
  //RUN IN REAL DEVICE
  //FOR ANDROID ONLY
  updateAvailability() {
    InAppUpdate.checkForUpdate().then((updateInfo) {
      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        if (updateInfo.immediateUpdateAllowed) {
          InAppUpdate.performImmediateUpdate().then((appUpdateResult) {
            if (appUpdateResult == AppUpdateResult.success) {}
          });
        }
      } else if (updateInfo.flexibleUpdateAllowed) {
        InAppUpdate.startFlexibleUpdate().then((appUpdateResult) {
          if (appUpdateResult == AppUpdateResult.success) {
            InAppUpdate.completeFlexibleUpdate();
          }
        });
      }
    });
  }
}
