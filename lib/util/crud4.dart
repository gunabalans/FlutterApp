import 'package:flutter/material.dart';
import 'package:me_arun/config/config.dart';
import 'package:me_arun/page/tpl/template.dart';
import 'package:me_arun/util/translations.dart';
import 'package:url_launcher/url_launcher.dart';

class Crud4 {
  var ff;
  var myhttp;
  var route;
  var formClass;

  Crud4({this.ff, this.myhttp, this.route, this.formClass});

  listElementDelete({BuildContext context, var id}) async {
    if (id != null) {
      myhttp.getHttpData(
          specificUrl: Config.url_base +
              route +
              Config.url_del +
              "?" +
              formClass.primaryKey +
              "=$id");
      return Template.sb(context, Translations.of(context).text("Initated"));
    } else {
      return Template.sb(context, Translations.of(context).text("idMissing"));
    }
  }

  updateBuilder(
      {Map<String, TextEditingController> textEditingControllerMap,
      var viewData}) {
    return Builder(builder: (BuildContext context) {
      return Template.listView(
          context: context,
          children: ff.editFormGen(
              context: context,
              textEditingControllerMap: textEditingControllerMap,
              viewData: viewData));
    });
  }

  viewBuilder({var viewData}) {
    return Builder(builder: (BuildContext context) {
      return Template.listView(
          context: context,
          children: ff.viewGen(context: context, viewData: viewData));
    });
  }

  frmBuilder({Map<String, TextEditingController> textEditingControllerMap}) {
    return Builder(builder: (BuildContext context) {
      return Template.listView(
          context: context,
          children: ff.gen(
              context: context,
              textEditingControllerMap: textEditingControllerMap));
    });
  }
} ///////////////////////////

//List view widget for enquiry form
class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key key,
    @required this.formClass,
    @required this.items,
    @required this.index,
  }) : super(key: key);

  final formClass;
  final items;
  final index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          border: new Border(
              bottom: BorderSide(
        color: Theme.of(context).dividerColor,
        //width: 1.0,
      ))),
      child: ListTile(
        key: Key(items[index][formClass.primaryKey]),
        leading: Icon(
          Icons.person,
          color: Theme.of(context).primaryColor,
        ),
        title: Text('${items[index]["Name"]}'),
        subtitle: Text('${items[index]["City"]}'),
        dense: true,
        trailing: IconButton(
          icon: Icon(Icons.call),
          color: Theme.of(context).primaryColor,
          onPressed: () => launch('tel:${items[index]["MobileNo"]}'),
        ),
        contentPadding: EdgeInsets.all(2.0),
      ),
    );
  }
}
