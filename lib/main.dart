import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myclinic/navigation_menu.dart';
import 'package:myclinic/screens/auth/login_screen.dart';
import 'package:myclinic/screens/auth/signup_screen.dart';
import 'package:myclinic/screens/auth/signup_second_screen.dart';
import 'package:myclinic/utils/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: FToastBuilder(),
      theme: KAppTheme.lighTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/signup2': (context) => const SignupSecondScreen(),
        '/navigationmenu': (context) => const NavigationMenu(),
      },
    );
  }
}
