import 'package:flutter/widgets.dart';

enum JustTransitionTypes {
  none,
  material,
  cupertino,
  fade,
  size,
  scale,
  slide,
}

class JustTransitionType {
  final JustTransitionTypes type;
  final Alignment? alignment;
  final Axis? axis;
  final TextDirection? textDirection;

  JustTransitionType.none()
      : type = JustTransitionTypes.none,
        alignment = null,
        axis = null,
        textDirection = null;

  JustTransitionType.material()
      : type = JustTransitionTypes.material,
        alignment = null,
        axis = null,
        textDirection = null;

  JustTransitionType.cupertino()
      : type = JustTransitionTypes.cupertino,
        alignment = null,
        axis = null,
        textDirection = null;

  JustTransitionType.fade()
      : type = JustTransitionTypes.fade,
        alignment = null,
        axis = null,
        textDirection = null;

  JustTransitionType.size({
    this.alignment = Alignment.centerRight,
    this.axis = Axis.horizontal,
  })  : type = JustTransitionTypes.size,
        textDirection = null;

  JustTransitionType.scale({
    this.alignment = Alignment.center,
  })  : type = JustTransitionTypes.scale,
        axis = null,
        textDirection = null;

  JustTransitionType.slide({
    this.textDirection = TextDirection.ltr,
  })  : type = JustTransitionTypes.slide,
        alignment = null,
        axis = null;
}
