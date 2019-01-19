import 'package:flutter/material.dart';
import 'package:me_arun/config/config.dart';
import 'package:me_arun/page/tpl/common_drawer.dart';
import 'package:me_arun/util/translations.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PrawnPage extends StatefulWidget {
  _PrawnPageState createState() => _PrawnPageState();
}

class _PrawnPageState extends State<PrawnPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                title: Text(
              Translations.of(context).text("Dashboard"),
              style: TextStyle(color: Theme.of(context).backgroundColor),
            )),
            //this is to avoid keyboad overlay and crash with the input boxes
            resizeToAvoidBottomPadding: false,
            drawer: CommonDrawer(),
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                child: StaggeredGridView.count(
                  crossAxisCount: 6,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                  children: <Widget>[
                    _buildTile(
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(children: <Widget>[
                          Material(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Image.asset(
                                          "assets/images/prawn.png")))),
                          new Positioned(
                            left: 10.0,
                            top: 10.0,
                            child: Text(
                                Translations.of(context).text("Fresh prawn"),
                                style: TextStyle(
                                    color: Theme.of(context).accentColor)),
                          ),
                          new Positioned(
                            right: 10.0,
                            bottom: 10.0,
                            child: Text(
                                Translations.of(context)
                                    .text("Starts at 500 / Kg"),
                                style: TextStyle(
                                    color: Theme.of(context).accentColor)),
                          ),
                        ]),
                      ),
                    ),
                    _buildTile(
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(children: <Widget>[
                          Material(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Image.asset(
                                          "assets/images/fish.png")))),
                          new Positioned(
                            left: 10.0,
                            top: 10.0,
                            child: Text(
                                Translations.of(context).text("Fresh Fish"),
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorDark)),
                          ),
                          new Positioned(
                            right: 10.0,
                            bottom: 10.0,
                            child: Text(
                                Translations.of(context)
                                    .text("Starts at 350 / Kg"),
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorDark)),
                          ),
                        ]),
                      ),
                    ),
                    _buildTile(
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(children: <Widget>[
                          Material(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Image.asset(
                                          "assets/images/crab.png")))),
                          new Positioned(
                            left: 10.0,
                            top: 10.0,
                            child: Text(
                                Translations.of(context).text("Live Crab"),
                                style: TextStyle(
                                    color: Theme.of(context).accentColor)),
                          ),
                          new Positioned(
                            right: 10.0,
                            bottom: 10.0,
                            child: Text(
                                Translations.of(context)
                                    .text("Starts at 500 / Kg"),
                                style: TextStyle(
                                    color: Theme.of(context).accentColor)),
                          ),
                        ]),
                      ),
                    ),
                    _buildTile(
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(children: <Widget>[
                          Material(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Image.asset(
                                          "assets/images/squid.png")))),
                          new Positioned(
                            left: 10.0,
                            top: 10.0,
                            child: Text(
                                Translations.of(context).text("Fresh Squid"),
                                style:
                                    TextStyle(color: Config.primaryColorDark)),
                          ),
                          new Positioned(
                            right: 10.0,
                            bottom: 10.0,
                            child: Text(
                                Translations.of(context)
                                    .text("Starts at 400 / Kg"),
                                style:
                                    TextStyle(color: Config.primaryColorDark)),
                          ),
                        ]),
                      ),
                    ),
                    _buildTile(
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(children: <Widget>[
                          Material(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Image.asset(
                                          "assets/images/lobster.png")))),
                          new Positioned(
                            left: 10.0,
                            top: 10.0,
                            child: Text(
                                Translations.of(context).text("Live Lobster"),
                                style: TextStyle(
                                    color: Theme.of(context).accentColor)),
                          ),
                          new Positioned(
                            right: 10.0,
                            bottom: 10.0,
                            child: Text(
                                Translations.of(context)
                                    .text("Starts at 500 / Kg"),
                                style: TextStyle(
                                    color: Theme.of(context).accentColor)),
                          ),
                        ]),
                      ),
                    ),
                  ],
                  staggeredTiles: [
                    StaggeredTile.extent(6, 125.0),
                    StaggeredTile.extent(6, 130.0),
                    StaggeredTile.extent(6, 130.0),
                    StaggeredTile.extent(6, 130.0),
                    StaggeredTile.extent(6, 130.0),
                  ],
                ))));
  }

  changeLanguage(String val) {
    Locale(val);
    var x = new TranslationsDelegate();
    if (x.isSupported(Locale(val))) {
      Translations.load(Locale(val));
    }
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('Not set yet');
                  },
            child: child));
  }
}
