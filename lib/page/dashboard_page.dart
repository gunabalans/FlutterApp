import 'package:flutter/material.dart';
import 'package:me_arun/page/tpl/common_drawer.dart';
import 'package:me_arun/util/translations.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DashboardPage extends StatefulWidget {
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<List<double>> charts = [
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4
    ],
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
    ],
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4
    ]
  ];

  static final List<String> chartDropdownItems = [
    'Last 7 days',
    'Last month',
    'Last year'
  ];
  String actualDropdown = chartDropdownItems[0];
  int actualChart = 0;

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
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      Translations.of(context)
                                          .text("TotalCustomers"),
                                      style:
                                          TextStyle(color: Colors.blueAccent)),
                                  Text('265K',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24.0))
                                ],
                              ),
                              Material(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Icon(Icons.timeline,
                                        color: Colors.white, size: 30.0),
                                  )))
                            ]),
                      ),
                    ),
                    _buildTile(
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Material(
                                  color: Colors.teal,
                                  shape: CircleBorder(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Icon(Icons.cloud,
                                        color: Colors.white, size: 30.0),
                                  )),
                              Padding(padding: EdgeInsets.only(bottom: 16.0)),
                              Text(Translations.of(context).text("Ycs"),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.0)),
                              Text(Translations.of(context).text("Work"),
                                  style: TextStyle(color: Colors.black45)),
                            ]),
                      ),
                    ),
                    _buildTile(
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Material(
                                  color: Colors.orange,
                                  shape: CircleBorder(),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Icon(Icons.notifications,
                                        color: Colors.white, size: 30.0),
                                  )),
                              Padding(padding: EdgeInsets.only(bottom: 16.0)),
                              Text(Translations.of(context).text('user'),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.0)),
                              Text(Translations.of(context).text('status'),
                                  style: TextStyle(color: Colors.black45)),
                            ]),
                      ),
                    ),
                    _buildTile(
                      Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                          Translations.of(context)
                                              .text('Revenue'),
                                          style:
                                              TextStyle(color: Colors.green)),
                                      Text('\₹46K',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24.0)),
                                    ],
                                  ),
                                  DropdownButton(
                                      isDense: true,
                                      value: actualDropdown,
                                      onChanged: (String value) => setState(() {
                                            actualDropdown = value;
                                            actualChart =
                                                chartDropdownItems.indexOf(
                                                    value); // Refresh the chart
                                          }),
                                      items: chartDropdownItems
                                          .map((String title) {
                                        return DropdownMenuItem(
                                          value: title,
                                          child: Text(title,
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.0)),
                                        );
                                      }).toList())
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 4.0)),
                              Sparkline(
                                data: charts[actualChart],
                                lineWidth: 5.0,
                                lineColor: Colors.greenAccent,
                              )
                            ],
                          )),
                    ),
                    _buildTile(
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      Translations.of(context)
                                          .text('BookingCount'),
                                      style:
                                          TextStyle(color: Colors.redAccent)),
                                  Text('213',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24.0))
                                ],
                              ),
                              Material(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Center(
                                      child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Icon(Icons.store,
                                        color: Colors.white, size: 30.0),
                                  )))
                            ]),
                      ),
                      onTap: () {},
                    )
                  ],
                  staggeredTiles: [
                    StaggeredTile.extent(6, 125.0),
                    StaggeredTile.extent(3, 185.0),
                    StaggeredTile.extent(3, 185.0),
                    StaggeredTile.extent(6, 230.0),
                    StaggeredTile.extent(6, 125.0),
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
