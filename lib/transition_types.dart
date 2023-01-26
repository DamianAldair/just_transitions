import 'package:flutter/widgets.dart';

enum JustTransitionSpecificType {
  none,
  material,
  cupertino,
  fade,
  size,
  scale,
  slide,
}

class JustTransitionType {
  final JustTransitionSpecificType type;
  final Alignment? alignment;
  final Axis? axis;
  final TextDirection? textDirection;

  JustTransitionType.none()
      : type = JustTransitionSpecificType.none,
        alignment = null,
        axis = null,
        textDirection = null;

  JustTransitionType.material()
      : type = JustTransitionSpecificType.material,
        alignment = null,
        axis = null,
        textDirection = null;

  JustTransitionType.cupertino()
      : type = JustTransitionSpecificType.cupertino,
        alignment = null,
        axis = null,
        textDirection = null;

  JustTransitionType.fade()
      : type = JustTransitionSpecificType.fade,
        alignment = null,
        axis = null,
        textDirection = null;

  JustTransitionType.size({
    this.alignment = Alignment.centerRight,
    this.axis = Axis.horizontal,
  })  : type = JustTransitionSpecificType.size,
        textDirection = null;

  JustTransitionType.scale({
    this.alignment = Alignment.center,
  })  : type = JustTransitionSpecificType.scale,
        axis = null,
        textDirection = null;

  JustTransitionType.slide({
    this.textDirection = TextDirection.ltr,
  })  : type = JustTransitionSpecificType.slide,
        alignment = null,
        axis = null;
}
