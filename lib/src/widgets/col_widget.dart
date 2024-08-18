import 'package:flutter/material.dart';

import '../consts/constants.dart';

/// The `RCol` widget is a responsive column that adjusts its width based on
/// the screen size, similar to how columns work in CSS frameworks like Bootstrap.
/// It considers the spacing provided by the `RRow` to ensure proper layout.
///
/// **Parameters:**
///
/// * `xs`: An optional column span (out of 12) for extra small screens.
/// * `sm`: An optional column span (out of 12) for small screens.
/// * `md`: An optional column span (out of 12) for medium screens.
/// * `lg`: An optional column span (out of 12) for large screens.
/// * `xl`: An optional column span (out of 12) for extra large screens.
/// * `spacing`: The horizontal space between columns as defined in `RRow`. Default is `0.0`.
/// * `child`: The widget to be displayed inside the column. This is required.
class RCol extends StatelessWidget {
  final int? xs;
  final int? sm;
  final int? md;
  final int? lg;
  final int? xl;
  final double spacing;
  final Widget child;

  /// Constructs an `RCol` widget.
  ///
  /// The `child` is required and represents the widget that will be displayed
  /// inside the column.
  ///
  /// The `xs`, `sm`, `md`, `lg`, and `xl` parameters are optional and allow
  /// customization of the column's width at different screen sizes.
  /// If a size is not provided, the column will use the value from the next smallest breakpoint.
  ///
  /// The `spacing` parameter defines the horizontal space between columns, which is used
  /// to adjust the width of the column accordingly.
  const RCol({
    super.key,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.spacing = r_default_spacing,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen width once
    final double screenWidth = MediaQuery.of(context).size.width;
    final int colSpan = _getColumnSpan(screenWidth);

    // Compute total spacing and column width
    final double columnWidth = _calculateColumnWidth(screenWidth, colSpan);

    // The `SizedBox` widget is used to apply the calculated column width
    // to the child widget.
    return SizedBox(
      width: columnWidth,
      child: child,
    );
  }

  /// Determines the column span based on the screen width.
  ///
  /// The `_getColumnSpan` method calculates the column width (out of 12)
  /// based on the current screen width, using the appropriate breakpoint value.
  /// If a value for a larger breakpoint is not provided, it falls back to
  /// the next smallest breakpoint.
  int _getColumnSpan(double screenWidth) {
    // Define breakpoints as constants
    const double xlBreakpoint = 1200;
    const double lgBreakpoint = 992;
    const double mdBreakpoint = 768;
    const double smBreakpoint = 576;

    // Default column span for each breakpoint
    final int effectiveXs = xs ?? 12;
    final int effectiveSm = sm ?? effectiveXs;
    final int effectiveMd = md ?? effectiveSm;
    final int effectiveLg = lg ?? effectiveMd;
    final int effectiveXl = xl ?? effectiveLg;

    // Determine the column span based on the screen width
    if (screenWidth >= xlBreakpoint) return effectiveXl;
    if (screenWidth >= lgBreakpoint) return effectiveLg;
    if (screenWidth >= mdBreakpoint) return effectiveMd;
    if (screenWidth >= smBreakpoint) return effectiveSm;
    return effectiveXs;
  }

  /// Calculates the width of the column considering the spacing.
  ///
  /// The `_calculateColumnWidth` method determines the column width by
  /// subtracting the total spacing from the screen width and then dividing
  /// by the number of columns (12) and multiplying by the column span.
  double _calculateColumnWidth(double screenWidth, int colSpan) {
    final double totalSpacing = spacing * (colSpan - 1);
    return (screenWidth - totalSpacing) / 12 * colSpan;
  }
}
