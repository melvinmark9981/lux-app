import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/profile_setup_screen.dart';
import 'screens/profile_page.dart';
import 'screens/admin_page.dart';
import 'screens/sales_dashboard.dart';
import 'screens/dashboard_screen.dart';

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
        fontFamily: 'AppLuxFont', // Use this if you've added the custom font
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF4D67),
          primary: const Color(0xFFFF4D67),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF4D67),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color(0xFFF5F5F5),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/profile_setup': (context) => const ProfileSetupScreen(),
        '/profile': (context) => ProfilePage(),
        '/admin': (context) => AdminPage(),
        '/sales_dashboard': (context) => const SalesDashboard(),
        '/dashboard': (context) => const DashboardScreen(),
        // Additional routes
        '/event': (context) => const PlaceholderScreen(title: 'Event'),
        '/leaderboard':
            (context) => const PlaceholderScreen(title: 'Leaderboard'),
        '/message': (context) => const PlaceholderScreen(title: 'Message'),
        '/order': (context) => const PlaceholderScreen(title: 'Order'),
        '/product': (context) => const PlaceholderScreen(title: 'Product'),
        '/registered_users':
            (context) => const PlaceholderScreen(title: 'Registered Users'),
        '/sales_report':
            (context) => const PlaceholderScreen(title: 'Sales Report'),
        '/settings': (context) => const PlaceholderScreen(title: 'Settings'),
      },
    );
  }
}

// Placeholder screen for routes that haven't been implemented yet
class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction, size: 80, color: Colors.grey),
            SizedBox(height: 24),
            Text(
              '$title Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'This screen is under construction',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
              child: Text('Back to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
