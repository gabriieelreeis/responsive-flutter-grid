import 'package:flutter/material.dart';

import '../consts/constants.dart';

/// The `RRow` widget is a flexible container that arranges its child widgets
/// in a horizontal layout, similar to a `Row`, but with the added capability
/// to wrap items onto a new line when they exceed the available width.
///
/// It is useful for creating responsive layouts where items should flow
/// naturally into the next line when necessary, maintaining spacing
/// between items and controlling alignment along the main and cross axes.
///
/// **Parameters:**
///
/// * `children`: A list of widgets to be arranged horizontally within the row. This is required.
/// * `mainAxisAlignment`: An optional parameter to control the alignment of children along the main axis (horizontal axis).
/// * `crossAxisAlignment`: An optional parameter to control the alignment of children along the cross axis (vertical axis).
/// * `spacing`: The horizontal space between child widgets. The default is `0.0`.
/// * `runSpacing`: The vertical space between lines of child widgets. The default is `0.0`.
class RRow extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  final WrapAlignment alignment;
  final WrapCrossAlignment crossAlignment;

  /// Constructs an `RRow` widget.
  ///
  /// The `children` parameter is required and represents the list of widgets
  /// that will be arranged horizontally in the row.
  ///
  /// The `mainAxisAlignment` and `crossAxisAlignment` parameters are optional
  /// and allow customization of how the children are aligned within the row.
  ///
  /// The `spacing` parameter controls the space between items on the same line,
  /// while `runSpacing` controls the space between lines when wrapping occurs.
  RRow({
    super.key,
    required this.children,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    this.spacing = r_default_spacing,
    this.runSpacing = r_default_spacing,
  })  : alignment = _getWrapAlignment(mainAxisAlignment),
        crossAlignment = _getWrapCrossAlignment(crossAxisAlignment);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // Defines the horizontal space between the child widgets.
      spacing: spacing,

      // Defines the vertical space between lines when wrapping occurs.
      runSpacing: runSpacing,

      // Determines the alignment of children along the main axis.
      alignment: alignment,

      // Determines the alignment of children along the cross axis.
      crossAxisAlignment: crossAlignment,

      // The children widgets to be arranged within the row.
      children: children,
    );
  }

  /// Converts the `MainAxisAlignment` to the corresponding `WrapAlignment`.
  ///
  /// This helper function maps the `MainAxisAlignment` values to `WrapAlignment`
  /// so that the `Wrap` widget can properly align its children.
  static WrapAlignment _getWrapAlignment(MainAxisAlignment? alignment) {
    switch (alignment) {
      case MainAxisAlignment.center:
        return WrapAlignment.center;
      case MainAxisAlignment.end:
        return WrapAlignment.end;
      case MainAxisAlignment.spaceAround:
        return WrapAlignment.spaceAround;
      case MainAxisAlignment.spaceBetween:
        return WrapAlignment.spaceBetween;
      case MainAxisAlignment.spaceEvenly:
        return WrapAlignment.spaceEvenly;
      case MainAxisAlignment.start:
      default:
        return WrapAlignment.start;
    }
  }

  /// Converts the `CrossAxisAlignment` to the corresponding `WrapCrossAlignment`.
  ///
  /// This helper function maps the `CrossAxisAlignment` values to `WrapCrossAlignment`
  /// so that the `Wrap` widget can properly align its children along the cross axis.
  static WrapCrossAlignment _getWrapCrossAlignment(
      CrossAxisAlignment? alignment) {
    switch (alignment) {
      case CrossAxisAlignment.start:
        return WrapCrossAlignment.start;
      case CrossAxisAlignment.end:
        return WrapCrossAlignment.end;
      case CrossAxisAlignment.center:
      default:
        return WrapCrossAlignment.center;
    }
  }
}
