import 'package:flutter/material.dart';

class Col extends StatelessWidget {
  final BuildContext? context;
  final double? width;
  final Size? size;
  final BoxConstraints? boxConstraints;

  final Widget child;
  final bool auto;
  final int? xs;
  final int? sm;
  final int? md;
  final int? lg;
  final int? xl;
  final int? xxl;

  const Col({super.key, required this.child, this.context, this.width, this.size, this.boxConstraints, this.auto = false, this.xs = 12, this.sm, this.md, this.lg, this.xl, this.xxl});

  @override
  Widget build(BuildContext context) {
    double viewWidth = MediaQuery.of(context).size.width;

    if (width != null) {
      viewWidth = width!;
    } else if (size != null && size!.width.isFinite) {
      viewWidth = size!.width;
    } else if (boxConstraints != null && boxConstraints!.maxWidth.isFinite) {
      viewWidth = boxConstraints!.maxWidth;
    }

    double factor = (xs ?? 12) / 12;

    if (viewWidth > 576 && sm != null && sm! > 0) factor = sm! / 12;
    if (viewWidth > 768 && md != null && md! > 0) factor = md! / 12;
    if (viewWidth > 992 && lg != null && lg! > 0) factor = lg! / 12;
    if (viewWidth > 1200 && xl != null && xl! > 0) factor = xl! / 12;
    if (viewWidth > 1400 && xxl != null && xxl! > 0) factor = xxl! / 12;

    if (auto == false) {
      return FractionallySizedBox(
        widthFactor: factor,
        child: child,
      );
    } else {
      return Flexible(
        child: child,
      );
    }
  }
}
