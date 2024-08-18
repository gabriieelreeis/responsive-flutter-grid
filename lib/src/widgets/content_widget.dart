import 'package:flutter/material.dart';

import '../consts/constants.dart';

/// The `RContent` widget is a container that provides consistent padding,
/// margin, and maximum width constraints for its child widget.
///
/// It is similar in concept to a "container" in CSS frameworks like Bootstrap,
/// where content is centered on the page and constrained to a maximum width,
/// with optional padding and margin.
///
/// The `fluid` property allows the content to expand to fill the entire width
/// of the parent container, or be constrained to a fixed maximum width.
///
/// **Parameters:**
///
/// * `child`: The widget to be displayed inside the `RContent` container. This is required.
/// * `padding`: An optional padding to be applied inside the container. If not provided, a default padding is applied.
/// * `margin`: An optional margin to be applied outside the container. If not provided, a default margin is applied.
/// * `fluid`: A boolean flag that determines if the container should be fluid (expand to full width) or constrained to a maximum width (default is `false`).
class RContent extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool fluid;

  /// Constructs an `RContent` widget.
  ///
  /// The `child` is a required parameter, and it represents the widget
  /// that will be contained within the `RContent`.
  ///
  /// The `padding` and `margin` parameters are optional and allow customization
  /// of the space inside and outside the container, respectively.
  ///
  /// The `fluid` parameter determines whether the container should expand to
  /// the full width of its parent or be constrained to a fixed maximum width.
  const RContent({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.fluid = false,
  });

  @override
  Widget build(BuildContext context) {
    final BoxConstraints constraints = fluid
        ? const BoxConstraints(maxWidth: double.infinity)
        : const BoxConstraints(maxWidth: r_max_width);

    return Container(
      // Apply the provided padding, or a default padding if not specified.
      padding: padding ?? const EdgeInsets.all(r_default_spacing),

      // Apply the provided margin, or a default margin if not specified.
      margin:
          margin ?? const EdgeInsets.symmetric(horizontal: r_default_spacing),

      // Constrain the width of the child widget based on the fluid property.
      child: ConstrainedBox(
        constraints: constraints,
        child: child,
      ),
    );
  }
}
