import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  CustomPageRoute({
    required this.child,
    this.direction = AxisDirection.right,
}) : super(
    reverseTransitionDuration: Duration(milliseconds: 500),
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => child,
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation,Widget child) =>
  // ScaleTransition(
  //     scale: animation,
  //     child: child,
  //     );
 //SlideTransition(position: Tween<Offset>(begin: Offset(-1,0),end: Offset.zero).animate(animation),child: child,);
SlideTransition(position: Tween<Offset>(begin: getBeginOffset(),end: Offset.zero).animate(animation),child: child,);


  Offset getBeginOffset(){
    switch (direction) {
      case AxisDirection.up:
        return Offset(0, 1);
      case AxisDirection.down:
        return Offset(0,-1);
      case AxisDirection.right:
        return Offset(-1, 0);
      case AxisDirection.left:
        return Offset(1, 0);
    }
  }


}

