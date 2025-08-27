import 'package:flutter/material.dart';

class CompletionScreen extends StatelessWidget {
  const CompletionScreen({super.key});

  Widget _pill(String text, {bool active = false}) {
    final color = active ? const Color(0xFF42FF9E) : Colors.white24;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(active ? 0.18 : 0.12),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: color),
        boxShadow: active ? [BoxShadow(color: color.withOpacity(0.4), blurRadius: 10)] : [],
      ),
      child: Text(text, style: TextStyle(color: active ? Colors.white : Colors.white70)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
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
                  const Icon(Icons.favorite, color: Color(0xFF42FF9E), size: 90),
                  const SizedBox(height: 16),
                  const Text("Beautiful", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text("You've completed your session", style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 32),

                  // Before/After row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _pill("Anxious"),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(Icons.arrow_forward, color: Colors.white60),
                      ),
                      _pill("Peaceful", active: true),
                    ],
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    "Thank yourself for taking this time.\nBreathe. Smile. Carry this stillness with you.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white60),
                  ),
                  const SizedBox(height: 36),

                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF42FF9E)),
                          foregroundColor: const Color(0xFF42FF9E),
                        ),
                        onPressed: () {},
                        child: const Text("Capture Moment"),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false),
                        child: const Text("Start New Session"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false),
                        child: const Text("Return Home"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
