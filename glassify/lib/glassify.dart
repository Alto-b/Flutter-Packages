import 'dart:ui';
import 'package:flutter/material.dart';

class Glassify extends StatelessWidget {
  /// The widget inside the glass container.
  final Widget? child;

  /// Blur intensity for the glass effect.
  final double blur;

  /// Padding inside the container.
  final EdgeInsetsGeometry padding;

  /// Border radius for rounded corners.
  final BorderRadius borderRadius;

  /// The clip behavior of the container.
  final Clip clipBehavior;

  /// Background color of the container.
  final Color? color;

  /// Border color of the container.
  final Color? borderColor;

  /// BoxShadow list to control elevation.
  final List<BoxShadow>? boxShadow;

  /// Optional full override for decoration.
  final BoxDecoration? decoration;

  const Glassify({
    super.key,
    this.child,
    this.blur = 12.0,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.clipBehavior = Clip.hardEdge,
    this.color,
    this.borderColor,
    this.boxShadow,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final Color defaultBackground = color ??
        (isDark
            ? const Color(0x0DFFFFFF) // ~5% white
            : const Color(0x40FFFFFF)); // ~25% white

    final Color defaultBorder = borderColor ??
        (isDark
            ? const Color(0x14FFFFFF) // ~8% white
            : const Color(0x40FFFFFF)); // ~25% white

    final List<BoxShadow> defaultShadow = boxShadow ??
        [
          BoxShadow(
            color: isDark
                ? const Color(0x4D000000) // ~30% black
                : const Color(0x0DFFFFFF), // ~5% white
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ];

    return ClipRRect(
      borderRadius: borderRadius,
      clipBehavior: clipBehavior,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: decoration ??
              BoxDecoration(
                color: defaultBackground,
                borderRadius: borderRadius,
                border: Border.all(color: defaultBorder),
                boxShadow: defaultShadow,
              ),
          child: child,
        ),
      ),
    );
  }
}
