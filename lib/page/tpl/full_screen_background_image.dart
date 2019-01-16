import 'package:flutter/material.dart';

////////////////////////////////////
///FullScreenBackgroundImage/////////
///////////////////////////////////

class FullScreenBackgroundImage extends StatelessWidget {
  final String backgroundImage;
  final double fractionalOffsetDx;
  final double fractionalOffsetDy;

  final Color clr = Colors.white.withOpacity(0.2);

  final filterColorMode;
  final blMode = BlendMode.color;
  final blendMode;
  final Widget child;

  FullScreenBackgroundImage(
      {@required this.backgroundImage,
      this.fractionalOffsetDx = 0.0,
      this.fractionalOffsetDy = 1.0,
      this.filterColorMode,
      this.blendMode,
      this.child})
      : assert(backgroundImage != null && backgroundImage is String);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(backgroundImage),
            alignment: FractionalOffset(fractionalOffsetDx, fractionalOffsetDy),
            fit: BoxFit.cover,
            matchTextDirection: true,
            colorFilter: new ColorFilter.mode(
                filterColorMode ?? clr, blendMode ?? blMode),
          )),
          child: child ?? null),
    );
  }
}
//////////////////////////////////