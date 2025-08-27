import 'package:flutter/material.dart';
import '../widgets/glowing_button.dart';

class FeelingScreen extends StatelessWidget {
  const FeelingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moods = [
      ["🧘", "Calm"],
      ["😰", "Anxious"],
      ["😔", "Sad"],
      ["⚡", "Energetic"],
      ["😴", "Sleepy"],
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
            colors: [Color(0xFF0B1426), Color(0xFF101C2C)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  const Text("How are you feeling?",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text("Speak your heart or choose below",
                      style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 28),

                  GlowingButton(
                    icon: Icons.mic,
                    onTap: () => Navigator.pushNamed(context, '/breathing'),
                  ),
                  const SizedBox(height: 12),
                  const Text("Tap to speak", style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 28),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 1.5,
                    ),
                    itemCount: moods.length,
                    itemBuilder: (context, i) {
                      final emoji = moods[i][0];
                      final label = moods[i][1];
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/breathing'),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0x1AFFFFFF),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(emoji, style: const TextStyle(fontSize: 28)),
                                const SizedBox(height: 6),
                                Text(label, style: const TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Your mood helps us create a personalized experience.\nEverything you share is private and sacred.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white54, fontSize: 12),
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
