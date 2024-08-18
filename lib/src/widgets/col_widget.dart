import 'package:flutter/material.dart';
import 'package:responsive_layout/src/consts/constants.dart';

/// The `RCol` widget is a responsive column that adjusts its width based on
/// the screen size, similar to how columns work in CSS frameworks like Bootstrap.
///
/// The column can be configured with different widths for various screen sizes
/// (`xs`, `sm`, `md`, `lg`, `xl`). If a specific size is not provided, the
/// column will inherit the size of the next smallest breakpoint.
///
/// **Parameters:**
///
/// * `xs`: An optional column span (out of 12) for extra small screens.
/// * `sm`: An optional column span (out of 12) for small screens.
/// * `md`: An optional column span (out of 12) for medium screens.
/// * `lg`: An optional column span (out of 12) for large screens.
/// * `xl`: An optional column span (out of 12) for extra large screens.
/// * `child`: The widget to be displayed inside the column. This is required.
class RCol extends StatelessWidget {
  final int? xs;
  final int? sm;
  final int? md;
  final int? lg;
  final int? xl;
  final Widget child;

  /// Constructs an `RCol` widget.
  ///
  /// The `child` is required and represents the widget that will be displayed
  /// inside the column.
  ///
  /// The `xs`, `sm`, `md`, `lg`, and `xl` parameters are optional and allow
  /// customization of the column's width at different screen sizes.
  /// If a size is not provided, the column will use the value from the next smallest breakpoint.
  const RCol({
    super.key,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the column span based on the screen width
    final int colSpan = _getColumnSpan(screenWidth);

    // Calculate the column width as a proportion of the screen width
    final double colWidth = (screenWidth / r_max_cols) * colSpan;

    // Use `SizedBox` to set the calculated width of the column
    return SizedBox(
      width: colWidth,
      child: child,
    );
  }

  /// Determines the column span based on the screen width.
  ///
  /// This method calculates the column width (out of 12) based on the current
  /// screen width, using the appropriate breakpoint value. If a value for a
  /// larger breakpoint is not provided, it falls back to the next smallest breakpoint.
  int _getColumnSpan(double screenWidth) {
    // Default values if specific sizes are not provided
    int effectiveXs = xs ?? 12; // Default to full width if xs is not specified
    int effectiveSm = sm ?? effectiveXs;
    int effectiveMd = md ?? effectiveSm;
    int effectiveLg = lg ?? effectiveMd;
    int effectiveXl = xl ?? effectiveLg;

    // Determine the column span based on the screen width
    if (screenWidth >= r_xl_min_with) {
      return effectiveXl;
    } else if (screenWidth >= r_lg_min_with) {
      return effectiveLg;
    } else if (screenWidth >= r_md_min_with) {
      return effectiveMd;
    } else if (screenWidth >= r_sm_min_with) {
      return effectiveSm;
    } else {
      return effectiveXs;
    }
  }
}
