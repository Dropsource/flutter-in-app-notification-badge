import 'package:flutter/material.dart';

class BadgeIcon extends StatelessWidget {
  BadgeIcon(
      {this.icon,
      this.badgeCount = 0,
      this.showIfZero = false,
      this.badgeColor = Colors.red,
      TextStyle badgeTextStyle})
      : this.badgeTextStyle = badgeTextStyle ??
            TextStyle(
              color: Colors.white,
              fontSize: 8,
            );
  final Widget icon;
  final int badgeCount;
  final bool showIfZero;
  final Color badgeColor;
  final TextStyle badgeTextStyle;

  @override
  Widget build(BuildContext context) {
    return new Stack(children: <Widget>[
      icon,
      if (badgeCount > 0 || showIfZero) badge(badgeCount),
    ]);
  }

  Widget badge(int count) => Positioned(
        right: 0,
        top: 0,
        child: new Container(
          padding: EdgeInsets.all(1),
          decoration: new BoxDecoration(
            color: badgeColor,
            borderRadius: BorderRadius.circular(7.5),
          ),
          constraints: BoxConstraints(
            minWidth: 15,
            minHeight: 15,
          ),
          child: Text(
            count.toString(),
            style: new TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
}
