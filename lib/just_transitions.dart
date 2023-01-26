library just_transitions;

export 'package:just_transitions/transition_types.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_transitions/transition_types.dart';

/// Abstract class containing all the methods for executing transitions
abstract class JustTransitions {
  static void _push(
    BuildContext context,
    Route<dynamic> route,
    bool replacement,
  ) =>
      replacement
          ? Navigator.pushReplacement(context, route)
          : Navigator.push(context, route);

  static void _withoutTransition(
    BuildContext context,
    Widget page,
    bool replacement,
  ) =>
      _push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => page,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
        replacement,
      );

  static void _materialTransition(
    BuildContext context,
    Widget page,
    bool replacement,
  ) =>
      _push(
        context,
        MaterialPageRoute(builder: (_) => page),
        replacement,
      );

  static void _cupertinoTransition(
    BuildContext context,
    Widget page,
    bool replacement,
  ) =>
      _push(
        context,
        CupertinoPageRoute(builder: (_) => page),
        replacement,
      );

  static void _fadeTransition(
    BuildContext context,
    Widget page,
    Duration? transitionDuration,
    Duration? reverseTransitionDuration,
    Curve? curve,
    Curve? reverseCurve,
    bool replacement,
  ) =>
      _push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => page,
          transitionDuration:
              transitionDuration ?? const Duration(milliseconds: 300),
          reverseTransitionDuration:
              reverseTransitionDuration ?? const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, page) {
            return FadeTransition(
              opacity: curve != null
                  ? Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: curve,
                        reverseCurve: reverseCurve,
                      ),
                    )
                  : animation,
              child: page,
            );
          },
        ),
        replacement,
      );

  static void _sizeTransition(
    BuildContext context,
    Widget page,
    Duration? transitionDuration,
    Duration? reverseTransitionDuration,
    Curve? curve,
    Curve? reverseCurve,
    bool replacement,
    JustTransitionType type,
  ) =>
      _push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => page,
          transitionDuration:
              transitionDuration ?? const Duration(milliseconds: 700),
          reverseTransitionDuration:
              reverseTransitionDuration ?? const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, page) {
            assert(type.alignment != null, 'aligment can not be null');
            assert(type.axis != null, 'axis can not be null');
            return Align(
              alignment: type.alignment!,
              child: SizeTransition(
                sizeFactor: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: curve ?? Curves.fastLinearToSlowEaseIn,
                    reverseCurve: reverseCurve ?? Curves.fastOutSlowIn,
                  ),
                ),
                axis: type.axis!,
                child: page,
              ),
            );
          },
        ),
        replacement,
      );

  static void _scaleTransition(
    BuildContext context,
    Widget page,
    Duration? transitionDuration,
    Duration? reverseTransitionDuration,
    Curve? curve,
    Curve? reverseCurve,
    bool replacement,
    JustTransitionType type,
  ) =>
      _push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => page,
          transitionDuration:
              transitionDuration ?? const Duration(milliseconds: 1000),
          reverseTransitionDuration:
              reverseTransitionDuration ?? const Duration(milliseconds: 200),
          transitionsBuilder: (_, animation, __, page) {
            return ScaleTransition(
              scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: curve ?? Curves.fastLinearToSlowEaseIn,
                  reverseCurve: reverseCurve ?? Curves.fastOutSlowIn,
                ),
              ),
              alignment: type.alignment!,
              child: page,
            );
          },
        ),
        replacement,
      );

  static void _slideTransition(
    BuildContext context,
    Widget page,
    Duration? transitionDuration,
    Duration? reverseTransitionDuration,
    Curve? curve,
    Curve? reverseCurve,
    bool replacement,
    JustTransitionType type,
  ) =>
      _push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => page,
          transitionDuration:
              transitionDuration ?? const Duration(milliseconds: 1000),
          reverseTransitionDuration:
              reverseTransitionDuration ?? const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, page) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: const Offset(0.0, 0.0),
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: curve ?? Curves.fastLinearToSlowEaseIn,
                  reverseCurve: reverseCurve ?? Curves.fastOutSlowIn,
                ),
              ),
              textDirection: type.textDirection,
              child: page,
            );
          },
        ),
        replacement,
      );

  /// Go to a [page] according to the desired transition [type].
  ///
  /// By default [replacement] is false.
  ///
  /// Setting [replacement] as false equals to:
  ///```
  /// Navigator.push(
  ///   context,
  ///   MaterialPageRoute(builder: (context) => name),
  /// );
  ///```
  /// Setting [replacement] as true equals to:
  ///```
  /// Navigator.pushReplacement(
  ///   context,
  ///   MaterialPageRoute(builder: (context) => name),
  /// );
  ///```
  static void goTo({
    required BuildContext context,
    required Widget page,
    bool replacement = false,
    JustTransitionType? type,
    Duration? transitionDuration,
    Duration? reverseTransitionDuration,
    Curve? curve,
    Curve? reverseCurve,
  }) {
    type ??= JustTransitionType.material();
    const exceptionText = '''
          When the type is JustTransition.none(), JustTransition.material() or JustTransition.cupertino(),
          transitionDuration, reverseTransitionDuration, curve and reverserCurve 
          must not be declared.
        ''';
    switch (type.type) {
      case JustTransitionSpecificType.material:
        assert(
          transitionDuration == null &&
              reverseTransitionDuration == null &&
              curve == null &&
              reverseCurve == null,
          exceptionText,
        );
        _materialTransition(
          context,
          page,
          replacement,
        );
        break;
      case JustTransitionSpecificType.cupertino:
        assert(
          transitionDuration == null &&
              reverseTransitionDuration == null &&
              curve == null &&
              reverseCurve == null,
          exceptionText,
        );
        _cupertinoTransition(
          context,
          page,
          replacement,
        );
        break;
      case JustTransitionSpecificType.fade:
        _fadeTransition(
          context,
          page,
          transitionDuration,
          reverseTransitionDuration,
          curve,
          reverseCurve,
          replacement,
        );
        break;
      case JustTransitionSpecificType.size:
        _sizeTransition(
          context,
          page,
          transitionDuration,
          reverseTransitionDuration,
          curve,
          reverseCurve,
          replacement,
          type,
        );
        break;
      case JustTransitionSpecificType.scale:
        _scaleTransition(
          context,
          page,
          transitionDuration,
          reverseTransitionDuration,
          curve,
          reverseCurve,
          replacement,
          type,
        );
        break;
      case JustTransitionSpecificType.slide:
        _slideTransition(
          context,
          page,
          transitionDuration,
          reverseTransitionDuration,
          curve,
          reverseCurve,
          replacement,
          type,
        );
        break;
      case JustTransitionSpecificType.none:
      default:
        assert(
          transitionDuration == null &&
              reverseTransitionDuration == null &&
              curve == null &&
              reverseCurve == null,
          exceptionText,
        );
        _withoutTransition(
          context,
          page,
          replacement,
        );
    }
  }
}
