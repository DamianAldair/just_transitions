# JustTransitions

A package to make it easy to navigate between routes using animations and customizing them with some features.

## Available transitions

- Without animation
- Material
- Cupertino
- Fade
- Size
- Scale
- Slide

## Getting started

Just import this library in the pubspec.yaml.
All done.

## Usage

To navigate to a new page, the following is normally used:

```dart
Navigator.push(
    context,
    MaterialPageRoute(
        builder: (BuildContext context) {
            return NewPage();
        },
    ),
);
```

Or it is also used:

```dart
Navigator.push(
    context,
    CupertinoPageRoute(
        builder: (BuildContext context) {
            return NewPage();
        },
    ),
);
```

With this library you can reduce all of the above to:

```dart
JustTransitions.goTo(
    context: context,
    page: NewPage(),
);
```

If the property `type` is not defined, `JustTransitionType.material()` is used by default.
The property type can be:

- `JustTransitionType.none()`
- `JustTransitionType.material()`
- `JustTransitionType.cupertino()`
- `JustTransitionType.fade()`
- `JustTransitionType.size()`
- `JustTransitionType.scale()`
- `JustTransitionType.slide()`
