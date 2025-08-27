import 'package:flutter/material.dart';
import '../widgets/progress_dots.dart';

enum BreathPhase { inhale, hold, exhale }

class BreathingScreen extends StatefulWidget {
  const BreathingScreen({super.key});

  @override
  State<BreathingScreen> createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 12))
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _controller.reset();
            _completedCycles++;
            if (_completedCycles >= _totalCycles) {
              Navigator.pushReplacementNamed(context, '/meditation');
            } else {
              _controller.forward();
            }
          }
        })
        ..forward();

  final int _totalCycles = 3;
  int _completedCycles = 0;

  BreathPhase get phase {
    final v = _controller.value;
    if (v < 0.4) return BreathPhase.inhale;   // 0-4.8s
    if (v < 0.6) return BreathPhase.hold;     // 4.8-7.2s
    return BreathPhase.exhale;                // 7.2-12s
  }

  double get scale {
    final v = _controller.value;
    if (v < 0.4) {
      final t = v / 0.4;
      return 0.6 + 0.4 * Curves.easeInOut.transform(t); // 0.6 -> 1.0
    } else if (v < 0.6) {
      return 1.0;
    } else {
      final t = (v - 0.6) / 0.4;
      return 1.0 - 0.4 * Curves.easeInOut.transform(t); // 1.0 -> 0.6
    }
  }

  String get phaseText {
    switch (phase) {
      case BreathPhase.inhale:
        return "Breathe in slowly...";
      case BreathPhase.hold:
        return "Rest in stillness...";
      case BreathPhase.exhale:
        return "Exhale gently...";
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, _) {
                      return Transform.scale(
                        scale: scale,
                        child: Container(
                          width: 180, height: 180,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF42FF9E).withOpacity(0.18),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF42FF9E).withOpacity(0.5),
                                blurRadius: 36, spreadRadius: 12,
                              )
                            ],
                            border: Border.all(color: const Color(0xFF42FF9E).withOpacity(0.9), width: 1.2),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, _) {
                      return Text(
                        phaseText,
                        style: const TextStyle(fontSize: 22, color: Colors.white),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Cycle ${_completedCycles + 1} of $_totalCycles",
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 40),
                  ProgressDots(total: _totalCycles, current: _completedCycles + 1),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF42FF9E)),
                          foregroundColor: const Color(0xFF42FF9E),
                        ),
                        onPressed: () {
                          if (_controller.isAnimating) {
                            _controller.stop();
                          } else {
                            _controller.forward();
                          }
                          setState(() {});
                        },
                        child: Text(_controller.isAnimating ? "Pause" : "Resume"),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () => Navigator.pushReplacementNamed(context, '/meditation'),
                        child: const Text("Continue"),
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
