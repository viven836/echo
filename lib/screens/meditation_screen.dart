import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/glowing_button.dart';
import '../widgets/wave_visualizer.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  Timer? _timer;
  int _seconds = 0;
  bool _paused = false;
  final int _target = 600; // 10:00

  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!_paused) {
        setState(() => _seconds++);
        if (_seconds >= _target) {
          t.cancel();
          Navigator.pushReplacementNamed(context, '/completion');
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _fmt(int s) =>
      "${(s ~/ 60).toString().padLeft(2, '0')}:${(s % 60).toString().padLeft(2, '0')}";

  @override
  Widget build(BuildContext context) {
    final progress = _seconds / _target;
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
                  // Timer Progress
                  LinearProgressIndicator(
                    value: progress.clamp(0, 1),
                    minHeight: 6,
                    color: const Color(0xFF42FF9E),
                    backgroundColor: Colors.white10,
                  ),
                  const SizedBox(height: 16),
                  Text("${_fmt(_seconds)} / 10:00",
                      style: const TextStyle(fontSize: 16, color: Colors.white70)),
                  const SizedBox(height: 24),

                  // Big glowing play/pause
                  GlowingButton(
                    icon: _paused ? Icons.play_arrow : Icons.pause,
                    onTap: () => setState(() => _paused = !_paused),
                    size: 130,
                    glowColor: const Color(0xFF42FF9E),
                  ),
                  const SizedBox(height: 24),

                  // Wave visualizer
                  const WaveVisualizer(height: 90, width: 300),

                  const SizedBox(height: 36),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF42FF9E)),
                          foregroundColor: const Color(0xFF42FF9E),
                        ),
                        onPressed: () => setState(() => _paused = !_paused),
                        child: Text(_paused ? "Resume" : "Pause"),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          _timer?.cancel();
                          Navigator.pushReplacementNamed(context, '/completion');
                        },
                        child: const Text("End Session"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    '"Peace comes from within. Do not seek it without."',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white60, fontStyle: FontStyle.italic),
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
