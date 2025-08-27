import 'dart:math' as math;
import 'package:flutter/material.dart';

class WaveVisualizer extends StatefulWidget {
  final int bars;
  final double height;
  final double width;
  final Color color;
  final Duration speed;

  const WaveVisualizer({
    super.key,
    this.bars = 28,
    this.height = 80,
    this.width = 240,
    this.color = const Color(0xFF42FF9E),
    this.speed = const Duration(milliseconds: 900),
  });

  @override
  State<WaveVisualizer> createState() => _WaveVisualizerState();
}

class _WaveVisualizerState extends State<WaveVisualizer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: widget.speed)..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final t = _controller.value * 2 * math.pi;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.bars, (i) {
              final phase = i / widget.bars * 2 * math.pi;
              final h = (math.sin(t + phase) * 0.5 + 0.5); // 0..1
              final barH = 8 + h * (widget.height - 8);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Container(
                  width: 5,
                  height: barH,
                  decoration: BoxDecoration(
                    color: widget.color.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: widget.color.withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
