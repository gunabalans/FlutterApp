import 'package:flutter/material.dart';
import 'package:me_arun/config/ycs_route.dart';
import 'package:me_arun/page/tpl/common_drawer.dart';
import 'package:me_arun/util/translations.dart';

class FishPage extends StatefulWidget {
  _FishPageState createState() => _FishPageState();
}

class _FishPageState extends State<FishPage> {
  List<Map> data = [
    {
      "seaFoodID": "1",
      "name": "mackerl",
      "todayPrice": 40,
      "unitOfPrice": "Piece",
      "imageUrl": "fish_mackerl.jpg"
    },
    {
      "seaFoodID": "2",
      "name": "Pomfret",
      "todayPrice": 700,
      "unitOfPrice": "Kg",
      "imageUrl": "fish_pomfret.png"
    },
    {
      "seaFoodID": "3",
      "name": "Tuna",
      "todayPrice": 800,
      "unitOfPrice": "Kg",
      "imageUrl": "fish_tuna.png"
    },
    {
      "seaFoodID": "3",
      "name": "RedSnapper",
      "todayPrice": 550,
      "unitOfPrice": "Kg",
      "imageUrl": "fish_red_snapper.jpg"
    }
  ];

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
              //print('constraints=' + constraints.toString());
              var top = constraints.biggest.height;
              return FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    Translations.of(context).text("SeaFish"),
                    style: TextStyle(
                        //fontSize: 14.0,
                        color: Theme.of(context).backgroundColor),
                  ),
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
            itemExtent: 250, // I'm forcing item heights
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                  child: _buildTile(
                    Padding(
                      key: Key(data[index]["seaFoodID"]),
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(children: <Widget>[
                        Material(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: Image.asset("assets/images/" +
                                        data[index]["imageUrl"])))),
                        new Positioned(
                          left: 10.0,
                          top: 10.0,
                          child: Text(
                              Translations.of(context)
                                  .text('${data[index]["name"]}'),
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              )),
                        ),
                        new Positioned(
                          right: 10.0,
                          bottom: 10.0,
                          child: Text(
                              Translations.of(context)
                                      .text('${data[index]["todayPrice"]}') +
                                  " / " +
                                  Translations.of(context)
                                      .text('${data[index]["unitOfPrice"]}'),
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorDark)),
                        ),
                      ]),
                    ),
                  ),
                );
              },
              childCount: data.length,
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

  onTap(int seaFishID) {
    print("move to fish page");
    Navigator.of(context).pushNamed(YcsRoute.fish);
  }
}
