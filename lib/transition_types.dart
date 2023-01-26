import 'package:flutter/widgets.dart';

/// Enumeration containing the types of transition.
/// They are used internally by the library itself.
enum JustTransitionSpecificType {
  /// Without animation
  none,

  /// Material transition
  material,

  /// Cupertino transition
  cupertino,

  /// Fade transition
  fade,

  /// Size transition
  size,

  /// Scale transition
  scale,

  /// Slide transition
  slide,
}

/// Class defining the type of transition to be performed.
class JustTransitionType {
  /// To check internally the type of animation according to the named constructor used
  final JustTransitionSpecificType type;

  /// Alignment used to make the Size transition and Scale transition
  final Alignment? alignment;

  /// Axis used to make the Size transition
  final Axis? axis;

  /// Direction used to make the transition
  final TextDirection? textDirection;

  /// Without animation.
  /// Needs to be provided as [type] in [JustTransitions.goTo].
  JustTransitionType.none()
      : type = JustTransitionSpecificType.none,
        alignment = null,
        axis = null,
        textDirection = null;

  /// Material transition
  /// Needs to be provided as [type] in [JustTransitions.goTo].
  JustTransitionType.material()
      : type = JustTransitionSpecificType.material,
        alignment = null,
        axis = null,
        textDirection = null;

  /// Cupertino transition
  /// Needs to be provided as [type] in [JustTransitions.goTo].
  JustTransitionType.cupertino()
      : type = JustTransitionSpecificType.cupertino,
        alignment = null,
        axis = null,
        textDirection = null;

  /// Fade transition
  /// Needs to be provided as [type] in [JustTransitions.goTo].
  JustTransitionType.fade()
      : type = JustTransitionSpecificType.fade,
        alignment = null,
        axis = null,
        textDirection = null;

  /// Size transition
  /// Needs to be provided as [type] in [JustTransitions.goTo].
  JustTransitionType.size({
    this.alignment = Alignment.centerRight,
    this.axis = Axis.horizontal,
  })  : type = JustTransitionSpecificType.size,
        textDirection = null;

  /// Scale transition
  /// Needs to be provided as [type] in [JustTransitions.goTo].
  JustTransitionType.scale({
    this.alignment = Alignment.center,
  })  : type = JustTransitionSpecificType.scale,
        axis = null,
        textDirection = null;

  /// Slide transition
  /// Needs to be provided as [type] in [JustTransitions.goTo].
  JustTransitionType.slide({
    this.textDirection = TextDirection.ltr,
  })  : type = JustTransitionSpecificType.slide,
        alignment = null,
        axis = null;
}
