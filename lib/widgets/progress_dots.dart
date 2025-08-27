import 'package:flutter/material.dart';

class ProgressDots extends StatelessWidget {
  final int total;
  final int current;
  final Color activeColor;
  final Color inactiveColor;

  const ProgressDots({
    super.key,
    required this.total,
    required this.current,
    this.activeColor = const Color(0xFF42FF9E),
    this.inactiveColor = const Color(0x33FFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (i) {
        final active = i < current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: active ? 12 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: active ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: active
                ? [BoxShadow(color: activeColor.withOpacity(0.6), blurRadius: 8)]
                : [],
          ),
        );
      }),
    );
  }
}
