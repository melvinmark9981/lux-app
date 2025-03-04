import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/profile_setup_screen.dart';
import 'screens/profile_page.dart';
import 'screens/admin_page.dart'; // ✅ Keep if you need an Admin Panel

void main() {
  runApp(const AppLuxApp());
}

class AppLuxApp extends StatelessWidget {
  const AppLuxApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppLux',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFF4D67),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/profile_setup': (context) => const ProfileSetupScreen(),
        '/profile': (context) => ProfilePage(),
        '/admin': (context) => AdminPage(), // Use the correct class name
      },
    );
  }
}
