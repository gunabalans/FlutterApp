import 'package:flutter/material.dart';

class SingleColumn extends StatelessWidget {
  final List<Widget> children;

  final Color bodyColor;

  SingleColumn({this.bodyColor, this.children});

  //@override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            //this is to avoid keyboad overlay and crash with the input boxes
            resizeToAvoidBottomPadding: false,
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: bodyColor,
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            )));
  } //build

} //class close here
