import 'package:flutter/material.dart';

class AnimatedChild extends AnimatedWidget {
  final int index;
  final Color backgroundColor;
  final Color foregroundColor;
  final double elevation;
  final Widget child;

  final String label;
  final TextStyle labelStyle;
  final Color labelBackgroundColor;
  final Widget labelWidget;

  final bool visible;
  final VoidCallback onTap;
  final VoidCallback toggleChildren;
  final ShapeBorder shape;
  final String heroTag;

  AnimatedChild({
    Key key,
    Animation<double> animation,
    this.index,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation = 6.0,
    this.child,
    this.label,
    this.labelStyle,
    this.labelBackgroundColor,
    this.labelWidget,
    this.visible = false,
    this.onTap,
    this.toggleChildren,
    this.shape,
    this.heroTag,
  }) : super(key: key, listenable: animation);

  Widget buildLabel() {
    final Animation<double> animation = listenable;

    if (!((label != null || labelWidget != null) &&
        visible &&
        animation.value == 62.0)) {
      return Container();
    }

    if (labelWidget != null) return labelWidget;

    return GestureDetector(
      onTap: _performAction,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
        margin: EdgeInsets.only(right: 18.0),
        decoration: BoxDecoration(
          color: labelBackgroundColor ?? Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              offset: Offset(0.8, 0.8),
              blurRadius: 2.4,
            )
          ],
        ),
        child: Text(label, style: labelStyle),
      ),
    );
  }

  void _performAction() {
    if (onTap != null) onTap();
    toggleChildren();
  }

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return Container(
      height: animation.value,
      padding: EdgeInsets.only(bottom: 62.0 - animation.value),
      child: Container(
        padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
        child: FlatButton.icon(
          color: backgroundColor,
          onPressed: _performAction,
          icon: child,
          label: Text(label),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
