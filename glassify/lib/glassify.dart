import 'dart:ui';
import 'package:flutter/material.dart';

class Glassify extends StatelessWidget {
  /// The widget inside the glass container.
  final Widget? child;

  /// Opacity for the glass background color (0.0 - 1.0).
  final double opacity;

  /// Padding inside the container.
  final EdgeInsetsGeometry padding;

  /// Border radius for rounded corners.
  final BorderRadius borderRadius;

  /// The clip behavior of the container.
  final Clip clipBehavior;

  /// Background color of the container (opacity will be applied).
  final Color? color;

  /// Border color of the container.
  final Color? borderColor;

  /// BoxShadow list to control elevation.
  final List<BoxShadow>? boxShadow;

  /// Optional full override for decoration.
  final BoxDecoration? decoration;

  /// Gaussian blur intensity (sigmaX/Y). Optional override.
  final double blurSigma;

  const Glassify({
    super.key,
    this.child,
    this.opacity = 0.25,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.clipBehavior = Clip.hardEdge,
    this.color,
    this.borderColor,
    this.boxShadow,
    this.decoration,
    this.blurSigma = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final double clampedOpacity = opacity.clamp(0.0, 1.0);
    final int alphaValue = (clampedOpacity * 255).round();

    final Color baseColor = color ?? Colors.white;
    final Color backgroundWithOpacity = baseColor.withAlpha(alphaValue);

    final Color defaultBorder = borderColor ??
        (isDark
            ? Colors.white.withAlpha((0.08 * 255).round())
            : Colors.white.withAlpha(alphaValue));

    final List<BoxShadow> defaultShadow = boxShadow ??
        [
          BoxShadow(
            color: isDark
                ? Colors.black.withAlpha((0.3 * 255).round())
                : Colors.white.withAlpha((0.05 * 255).round()),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ];

    return ClipRRect(
      borderRadius: borderRadius,
      clipBehavior: clipBehavior,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          padding: padding,
          decoration: decoration ??
              BoxDecoration(
                color: backgroundWithOpacity,
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
