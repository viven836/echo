import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0B1426), Color(0xFF101C2C)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Echo",
                    style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "The Beat of Your Better Self",
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '"In the silence between breaths, find the rhythm of your soul"',
                    style: TextStyle(fontSize: 14, color: Colors.white60),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/feeling'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0x2642FF9E),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: const Color(0xFF42FF9E), width: 1.2),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF42FF9E).withOpacity(0.4),
                            blurRadius: 16,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: const Text(
                        "Begin Your Journey",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Close your eyes and listen to your breath",
                    style: TextStyle(color: Colors.white60),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
