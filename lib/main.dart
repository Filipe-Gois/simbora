import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbora/screens/home_screen.dart';
import 'package:simbora/screens/login_screen.dart';
import 'package:simbora/screens/signup_screen.dart';
import 'package:simbora/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:simbora/utils.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simbora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsApp.blue),
        scaffoldBackgroundColor: ColorsApp.yellow,
        useMaterial3: true,
        textTheme: GoogleFonts.montserratAlternatesTextTheme(),
      ),
      initialRoute: "/LoginScreen",
      routes: {
        "/SignupScreen": (context) => const SignupScreen(),
        "/LoginScreen": (context) => const LoginScreen(),
        "/": (context) => const HomeScreen(),
      },
    );
  }
}
