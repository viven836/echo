import 'package:flutter/material.dart';

// Import all your screens
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/feeling_screen.dart';
import 'screens/breathing_screen.dart';
import 'screens/meditation_screen.dart';
import 'screens/completion_screen.dart';

void main() {
  runApp(const EchoApp());
}

class EchoApp extends StatelessWidget {
  const EchoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Echo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0B132B), // cosmic dark bg
        primaryColor: Colors.greenAccent,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent.withOpacity(0.2),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),

      // 🔥 First screen will be Login
      initialRoute: '/',

      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/feeling': (context) => const FeelingScreen(),
        '/breathing': (context) => const BreathingScreen(),
        '/meditation': (context) => const MeditationScreen(),
        '/completion': (context) => const CompletionScreen(),
      },
    );
  }
}
