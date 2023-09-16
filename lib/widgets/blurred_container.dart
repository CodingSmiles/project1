import 'package:flutter/material.dart';
import 'dart:ui';

class BlurredContainer extends StatelessWidget {
  final double blur;
  final double opacity;
  final Widget child;

  const BlurredContainer({
    super.key,
    required this.blur,
    required this.opacity,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(opacity),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            border: Border.all(
              width: 1.5,
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
