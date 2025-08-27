import 'package:flutter/material.dart';

class GlowingButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;
  final Color glowColor;
  final bool filled;

  const GlowingButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 120,
    this.glowColor = const Color(0xFF42FF9E),
    this.filled = true,
  });

  @override
  State<GlowingButton> createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final v = 0.5 + 0.5 * _controller.value;
        return GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.filled
                  ? widget.glowColor.withOpacity(0.15 + 0.1 * _controller.value)
                  : Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: widget.glowColor.withOpacity(0.6),
                  blurRadius: 30 * v,
                  spreadRadius: 8 * v,
                ),
              ],
              border: Border.all(color: widget.glowColor.withOpacity(0.8), width: 1.2),
            ),
            child: Icon(widget.icon, size: widget.size * 0.33, color: widget.glowColor),
          ),
        );
      },
    );
  }
}
