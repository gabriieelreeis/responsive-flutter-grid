# Responsive Layout Flutter Package

This Flutter package provides responsive layout components inspired by CSS frameworks like Bootstrap. It includes widgets for creating responsive grid systems and layout containers that adapt to various screen sizes.

## Widgets

### `RContent`

The `RContent` widget is a container that provides consistent padding, margin, and maximum width constraints for its child widget. It is similar to a "container" in CSS frameworks, centering content on the page and constraining it to a maximum width, with optional padding and margin.

**Parameters:**
- `child`: The widget to be displayed inside the `RContent` container. This is required.
- `padding`: Optional padding to be applied inside the container. If not provided, a default padding is applied.
- `margin`: Optional margin to be applied outside the container. If not provided, a default margin is applied.
- `fluid`: A boolean flag determining if the container should expand to full width (`true`) or be constrained to a maximum width (`false`). Default is `false`.

**Example:**

```dart
RContent(
  padding: EdgeInsets.all(16.0),
  margin: EdgeInsets.symmetric(horizontal: 16.0),
  fluid: true,
  child: Text('Responsive Content'),
)
```

### `RRow`

The `RRow` widget is a flexible container that arranges its child widgets in a horizontal layout, similar to a `Row`, but with the added capability to wrap items onto a new line when they exceed the available width.

**Parameters:**
- `children`: A list of widgets to be arranged horizontally within the row. This is required.
- `mainAxisAlignment`: Optional parameter to control the alignment of children along the main axis (horizontal axis).
- `crossAxisAlignment`: Optional parameter to control the alignment of children along the cross axis (vertical axis).
- `spacing`: The horizontal space between child widgets. Default is `0.0`.
- `runSpacing`: The vertical space between lines of child widgets. Default is `0.0`.

**Example:**

```dart
RRow(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
  spacing: 8.0,
  runSpacing: 4.0,
  children: [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
)
```

### `RCol`

The `RCol` widget is a responsive column that adjusts its width based on the screen size, similar to how columns work in CSS frameworks like Bootstrap.

**Parameters:**
- `xs`: Optional column span (out of 12) for extra small screens.
- `sm`: Optional column span (out of 12) for small screens.
- `md`: Optional column span (out of 12) for medium screens.
- `lg`: Optional column span (out of 12) for large screens.
- `xl`: Optional column span (out of 12) for extra large screens.
- `child`: The widget to be displayed inside the column. This is required.

**Example:**

```dart
RCol(
  xs: 12,
  sm: 6,
  md: 4,
  lg: 3,
  xl: 2,
  child: Container(
    color: Colors.blue,
    child: Text('Responsive Column'),
  ),
)
```

## Installation

Add `responsive_layout` to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  responsive_layout:
    git:
      url: git://github.com/yourusername/responsive_layout.git
```

Then, run `flutter pub get` to install the package.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bugs.

## License

This package is licensed under the MIT License. See [LICENSE](LICENSE) for more details.

Inspired by responsive design principles from CSS frameworks like Bootstrap.
