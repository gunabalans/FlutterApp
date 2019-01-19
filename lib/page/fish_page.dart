import 'package:flutter/material.dart';
import 'package:me_arun/config/config.dart';
import 'package:me_arun/config/ycs_route.dart';
import 'package:me_arun/page/tpl/common_drawer.dart';
import 'package:me_arun/util/translations.dart';

class FishPage extends StatefulWidget {
  _FishPageState createState() => _FishPageState();
}

class _FishPageState extends State<FishPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      //this is to avoid keyboad overlay and crash with the input boxes
      resizeToAvoidBottomPadding: false,
      drawer: CommonDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 350.0,
            centerTitle: true,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              print('constraints=' + constraints.toString());
              var top = constraints.biggest.height;
              return FlexibleSpaceBar(
                  centerTitle: true,
                  title: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: top == 80.0 ? 1.0 : 0.0,
                      //opacity: 1.0,
                      child: Text(
                        "Sea Fish",
                        //style: TextStyle(fontSize: 12.0),
                      )),
                  background: Image.asset(
                    "assets/images/fish_background.jpg",
                    fit: BoxFit.cover,
                  ));
            }),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).accentColor, // Here
                ),
                onPressed: () {},
              ),
            ],
          ),
          SliverFixedExtentList(
            itemExtent: 125, // I'm forcing item heights
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text(
                    "$index",
                    style: TextStyle(fontSize: 20.0),
                  ),
                );
              },
              childCount: 5,
            ),
          ),
        ],
      ),

      //
    ));
  }

  changeLanguage(String val) {
    Locale(val);
    var x = new TranslationsDelegate();
    if (x.isSupported(Locale(val))) {
      Translations.load(Locale(val));
    }
  }

  Widget _buildTile(Widget child, {Function onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()
            onTap: () {
              if (onTap != null) {
                onTap();
              }
            },
            child: child));
  }

  onTapToCallFishPage() {
    print("move to fish page");
    Navigator.of(context).pushNamed(YcsRoute.fish);
  }
}
