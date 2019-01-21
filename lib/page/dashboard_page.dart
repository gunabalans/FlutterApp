import 'package:flutter/material.dart';
import 'package:me_arun/config/config.dart';
import 'package:me_arun/config/ycs_route.dart';
import 'package:me_arun/page/tpl/common_drawer.dart';
import 'package:me_arun/util/translations.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DashboardPage extends StatefulWidget {
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
                                Translations.of(context).text("FreshPrawn"),
                                style: TextStyle(
                                    color: Theme.of(context).accentColor)),
                          ),
                          new Positioned(
                            right: 10.0,
                            bottom: 10.0,
                            child: Text(
                                Translations.of(context).text("StartsAt") +
                                    " 600 / " +
                                    Translations.of(context).text("Kg"),
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
                                  Translations.of(context).text("FreshFish"),
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).primaryColorDark)),
                            ),
                            new Positioned(
                              right: 10.0,
                              bottom: 10.0,
                              child: Text(
                                  Translations.of(context).text("StartsAt") +
                                      " 350 / " +
                                      Translations.of(context).text("Kg"),
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).primaryColorDark)),
                            ),
                          ]),
                        ),
                        onTap: onTapToCallFishPage),
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
                                Translations.of(context).text("LiveCrab"),
                                style: TextStyle(
                                    color: Theme.of(context).accentColor)),
                          ),
                          new Positioned(
                            right: 10.0,
                            bottom: 10.0,
                            child: Text(
                                Translations.of(context).text("StartsAt") +
                                    "300 / " +
                                    Translations.of(context).text("Kg"),
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
                                Translations.of(context).text("FreshSquid"),
                                style:
                                    TextStyle(color: Config.primaryColorDark)),
                          ),
                          new Positioned(
                            right: 10.0,
                            bottom: 10.0,
                            child: Text(
                                Translations.of(context).text("StartsAt") +
                                    "400 / " +
                                    Translations.of(context).text("Kg"),
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
                                Translations.of(context).text("LiveLobster"),
                                style: TextStyle(
                                    color: Theme.of(context).accentColor)),
                          ),
                          new Positioned(
                            right: 10.0,
                            bottom: 10.0,
                            child: Text(
                                Translations.of(context).text("StartsAt") +
                                    "700 / " +
                                    Translations.of(context).text("Kg"),
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
