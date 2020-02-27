import 'package:flutter/material.dart';

class PopRoute extends PopupRoute {
  final Widget _child;

  PopRoute({
    @required Widget child,
  }):
        _child = child;


  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Duration get transitionDuration => Duration(milliseconds: 0);
  
  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return _child;
  }

  @override
  Widget buildTransitions (BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
    //return FadeTransition(opacity: animation, child: child);
    /*if (child is AnimatedWidget) {
      return child;
    }
    const Offset topLeft = const Offset(0.0, 0.0);
    const Offset topRight = const Offset(0.0, 0.0);
    const Offset bottomLeft = const Offset(0.0, 1.0);
    const Offset bottomRight = const Offset(0.0, 0.0);
    Offset startOffset = bottomLeft;
    Offset endOffset = topLeft;

      startOffset = bottomLeft;
      endOffset = bottomRight;

    return SlideTransition(
      position: Tween<Offset>(
        begin: startOffset,
        end: endOffset,
      ).animate(animation),
      child: child,
    );*/
  }



}
