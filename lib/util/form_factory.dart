/*
* @author Gunalan@whyceeyes.com
* @desc Form Factory
* @version 1.0 
*/
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:me/config/config.dart';
import 'package:me/page/tpl/template.dart';
import 'package:me/util/translations.dart';

class FormFactory {
  var myhttp;
  var route;
  var formClass;
  FormFactory({this.myhttp, this.route, this.formClass});

  // selectBox({BuildContext context, List list, Function calBack}) {
  //   List<DropdownMenuItem> dropDownList;

  //   list.map((v) {
  //     dropDownList.add(DropdownMenuItem<String>(
  //       value: v,
  //       child: new Text(Translations.of(context).text(v)),
  //     ));
  //   });

  //   return DropdownButtonFormField(
  //     items: dropDownList.toList(),
  //     onChanged: (val) {
  //       if (calBack != null) {
  //         calBack(val);
  //       }
  //     },
  //   );
  // }

  //text editing controller map (tec)
  static Map<String, TextEditingController> tec({var formClass}) {
    Map<String, TextEditingController> textEditingControllerMap = {};

    var formClassMap = formClass.form;
    formClassMap.forEach((k, v) {
      // textEditingControllerMap.putIfAbsent(
      //     k, () => new TextEditingController());
      textEditingControllerMap[k] = new TextEditingController();
    });
    return textEditingControllerMap;
  }

/*
* @description Reset the form values
* @var formClass isthe form class we build for crud
* @var textEditingControllerMap  is the TextEditingController Map
*/
  resetController(
      {Map<String, TextEditingController> textEditingControllerMap}) {
    var formClassMap = formClass.form;
    formClassMap.forEach((k, v) {
      if (textEditingControllerMap.containsKey(k)) {
        textEditingControllerMap[k].text = "";
      }
    });
  }

/*
* @description Save new form data using create api
*/
  saveController(
      {BuildContext context,
      Map<String, TextEditingController> textEditingControllerMap}) async {
    var formClassMap = formClass.form;

    Map formValMap = {};
    formClassMap.forEach((k, v) {
      if (textEditingControllerMap.containsKey(k)) {
        formValMap[k] = textEditingControllerMap[k].text;
      }
    });

    print(formValMap.toString());

    myhttp.postHttpData(
        specificUrl: Config.url_base + route + Config.url_add,
        body: formValMap);

    Template.sb(context, Translations.of(context).text("Initated"));
  }

  updateController({
    BuildContext context,
    Map<String, TextEditingController> textEditingControllerMap,
    var id,
  }) async {
    var formClassMap = formClass.form;

    Map formValMap = {};
    formValMap[formClass.primaryKey] = id;
    formClassMap.forEach((k, v) {
      if (textEditingControllerMap.containsKey(k)) {
        formValMap[k] = textEditingControllerMap[k].text;
      }
    });

    myhttp.postHttpData(
        specificUrl: Config.url_base + route + Config.url_update,
        body: formValMap);

    Template.sb(context, Translations.of(context).text("UpdateInitated"));
  }

  /*
  * generate View screen
  */
  List<Widget> viewGen({BuildContext context, var viewData}) {
    List<Widget> widgetList = <Widget>[];

    if (viewData != null) {
      //print(viewData.toString());
      viewData.forEach((k, v) {
        var x = Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20.0),
            decoration: Template.borderBottom(context),
            child: Text(Translations.of(context).text(k) + ': $v'));
        widgetList.add(x);
        widgetList.add(Template.sizeBox(height: 5.0));
      });

      // widgetList.add(ButtonBar(
      //   alignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     formButton(
      //         context: context,
      //         label: Translations.of(context).text("Edit"),
      //         onPressed: () {}),
      //   ],
      // ));
    } else {
      widgetList.add(Template.sizeBox(height: 1.0));
      widgetList.add(Text("No data To View"));
      widgetList.add(Template.sizeBox(height: 1.0));
    }
    return widgetList;
  }

/*
  * generate Edit form function
  *  
  */
  List<Widget> editFormGen(
      {BuildContext context, Map textEditingControllerMap, var viewData}) {
    List<Widget> widgetList = <Widget>[];
    print("test" + viewData.toString());
    if (viewData != null) {
      var formClassMap = formClass.form;
      formClassMap.forEach((k, v) {
        var x = selectFormElement(
            context: context,
            textEditCont: textEditingControllerMap[k],
            k: k,
            v: v);
        widgetList.add(x);
        widgetList.add(Template.sizeBox(height: 5.0));
      });

      widgetList.add(ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          formButton(
              context: context,
              label: Translations.of(context).text("Reset"),
              onPressed: () {
                resetController(
                    textEditingControllerMap: textEditingControllerMap);
              }),
          formButton(
              context: context,
              label: Translations.of(context).text("Update"),
              onPressed: () async {
                updateController(
                    context: context,
                    textEditingControllerMap: textEditingControllerMap,
                    id: viewData[formClass.primaryKey]);
              }),
        ],
      ));
    } else {
      widgetList.add(Template.sizeBox(height: 1.0));
      widgetList.add(Text("No data To View"));
      widgetList.add(Template.sizeBox(height: 1.0));
    }

    return widgetList;
  }

  /*
                * generate form function
                *  
                */
  List<Widget> gen({BuildContext context, Map textEditingControllerMap}) {
    List<Widget> widgetList = <Widget>[];

    // widgetList.add(Template.textTitle(context: context, title: formClass.title));
    // widgetList.add(Template.sizeBox(height: 5.0));
    if (formClass == null) {
      widgetList.add(Template.sizeBox(height: 25.0));
      widgetList.add(Text(Translations.of(context).text("FormClassMissing")));
      return widgetList;
    }
    var formClassMap = formClass.form;

    formClassMap.forEach((k, v) {
      var x = selectFormElement(
          context: context,
          textEditCont: textEditingControllerMap[k],
          k: k,
          v: v);

      widgetList.add(x);
      widgetList.add(Template.sizeBox(height: 5.0));
    });

    widgetList.add(ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        formButton(
            context: context,
            label: Translations.of(context).text("Reset"),
            onPressed: () {
              resetController(
                  textEditingControllerMap: textEditingControllerMap);
            }),
        formButton(
            context: context,
            label: Translations.of(context).text("Save"),
            onPressed: () async {
              saveController(
                  context: context,
                  textEditingControllerMap: textEditingControllerMap);
            }),
      ],
    ));

    return widgetList;
  }

  selectFormElement(
      {BuildContext context,
      TextEditingController textEditCont,
      String k,
      Map v,
      Function onChangeSelectMap}) {
    switch (v['inputType']) {
      case 'SELECTFROMURL':
        return SelectFromUrl(
          myhttp: myhttp,
          url: v.containsKey("url") ? v["url"] : "",
          label: Translations.of(context).text("Customer"),
          onChangeSelectMap: onChangeSelectMap ?? null,
          controller: textEditCont,
        );
      case 'SELECT':
        return SelectBox(
          map: v.containsKey("data")
              ? v["data"]
              : {"NoDataFound": Translations.of(context).text("NoDataFound")},
          label: Translations.of(context).text("Customer"),
          onChangeSelectMap: onChangeSelectMap ?? null,
          controller: textEditCont,
        );

      default:
        return this.textFormField(
            context: context,
            inputType: v['inputType'],
            label: v['hint'] ?? k,
            hint: k,
            max: v['max'] ?? null,
            min: v['min'] ?? null,
            mask: v['mask'] ?? null,
            maskSeperator: v['maskSeperator'] ?? null,
            required: v['required'] ?? false,
            controller: textEditCont);
        break;
    }
  }

  formButton(
      {BuildContext context,
      String label,
      VoidCallback onPressed,
      Color color, //Theme.of(context).accentColor,
      Color textColor //Colors.white
      }) {
    return MaterialButton(
      key: Key(label),
      color: (color != null) ? color : Theme.of(context).primaryColor,
      textColor:
          (textColor != null) ? textColor : Theme.of(context).backgroundColor,
      onPressed: onPressed,
      child: Text(Translations.of(context).text(label)),
      //splashColor: Colors.white30,
      //padding: EdgeInsets.fromLTRB(35.0, 8.0, 35.0, 8.0),
    );
  }

  /*
                * generate form text field
                *  
                * @example :ff.textFormField(
                   inputType: "TEXT",
                   context: context,
                   controller: search,
                   hint: "Search",
                  ),
                  
                */
  textFormField({
    BuildContext context,
    //Key key,
    String inputType,
    String label,
    String hint,
    int max,
    int min,
    //int maxLines : 1,
    bool required =
        false, //used in validation function, default false is defined in validation function
    //Function validate,
    String mask,
    String maskSeperator,
    TextEditingController controller,
  }) {
    return TextFormField(
      key: Key(label),

      autocorrect: false,

      inputFormatters: (mask != null && maskSeperator != null)
          ? [
              MaskedInput(mask: mask, separator: maskSeperator),
            ]
          : [],

      decoration: InputDecoration(
        labelText: Translations.of(context).text(label),
        hintText: Translations.of(context).text(hint),
        //helperText: Translations.of(context).text(hint),
      ),

      //initialValue: //never use initial value becauase we are using value controller,
      //Only one at a time that is either inital value or controller

      maxLines: (inputType == "MULTILINETEXT") ? 3 : 1,

      //scrollPadding: const EdgeInsets.all(5.0),

      keyboardType: this.keyBoard(inputType: inputType),
      //textInputAction: TextInputAction.done,
      //enableInteractiveSelection: true,
      obscureText: (inputType == "PASSWORD") ? true : false,

      validator: (String value) {
        return this.validation(
            context: context,
            label: label,
            inputType: inputType,
            required: required,
            value: value,
            max: max,
            min: min);
      },

      autovalidate: true,

      controller: controller,
    );
  }

  keyBoard({String inputType: "TEXT"}) {
    switch (inputType) {
      case "TEXT":
      case "PASSWORD":
        return TextInputType.text;
        break;
      case "NUMBER":
        return TextInputType.number;
        break;
      case "PHONE":
        return TextInputType.phone;
        break;
      case "EMAIL":
        return TextInputType.emailAddress;
        break;
      case "URL":
        return TextInputType.url;
        break;
      case "MULTILINETEXT":
        return TextInputType.multiline;
        break;
      case "DATETIME":
        return TextInputType.datetime;
        break;
      default:
        return TextInputType.text;
        break;
    }
  }

  validation(
      {BuildContext context,
      String label,
      String inputType = "TEXT",
      var value,
      int min,
      int max,
      bool required = false}) {
    if (required && value.isNotEmpty) {
      if (max != null) {
        min = null;
      }

      var t3 = Translations.of(context).text(label);

      if (max != null && value.length > max) {
        var t1 = Translations.of(context).text("ValidationMaxChar");
        var t2 = Translations.of(context).text("Characters");

        return "$t3 $t1 $max $t2";
      }

      if (min != null && value.length < min) {
        var t1 = Translations.of(context).text("ValidationMinChar");
        var t2 = Translations.of(context).text("Characters");
        return "$t3 $t1 $min $t2";
      }

      if (inputType == "EMAIL") {
        var t1 = Translations.of(context).text("ValidationNotVaidEmail");

        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        if (!RegExp(pattern).hasMatch(value))
          return Translations.of(context).text(value) + ' $t1';
      }

      if (inputType == "URL") {
        Pattern pattern =
            r"(https?|ftp)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
        if (!RegExp(pattern, caseSensitive: false).hasMatch(value))
          return Translations.of(context).text(value) +
              Translations.of(context).text("ValidationNotVaidUrl");
      }
    }
  }

//Form factory close here
}

//ref : https://pub.dartlang.org/packages/masked_text_input_formatter#-readme-tab-
class MaskedInput extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedInput({this.mask, this.separator})
      : assert(mask != null),
        assert(separator != null);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0 &&
        newValue.text.length > oldValue.text.length) {
      if (newValue.text.length > mask.length) return oldValue;

      if (newValue.text.length < mask.length &&
          mask[newValue.text.length - 1] == separator) {
        return TextEditingValue(
          text:
              '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
          selection: TextSelection.collapsed(
            offset: newValue.selection.end + 1,
          ),
        );
      }
    }
    return newValue;
  }
}

class SelectMap extends StatelessWidget {
  final List<DropdownMenuItem> dropDownList = [];
  final Map map;
  final String label;
  final Function onChangeSelectMap;

  SelectMap({@required this.map, this.label, this.onChangeSelectMap}) {
    map.forEach((k, v) {
      dropDownList.add(DropdownMenuItem<String>(
        value: k,
        child: new Text(v),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    var selectBoxvalue;

    return Container(
        child: new DropdownButton(
            items: dropDownList.toList(),
            hint: Text(Translations.of(context).text(label)),
            value: selectBoxvalue,
            onChanged: (value) {
              //label = value;
              selectBoxvalue = value;
              //print(selectBoxvalue);
              Locale(selectBoxvalue);
              onChangeSelectMap(value);
            }));
  }
}

class SelectBox extends StatefulWidget {
  final List<DropdownMenuItem> dropDownList = [];
  final Map map;
  final String label;
  final Function onChangeSelectMap;
  final bool isExpanded;
  final TextEditingController controller;

  SelectBox(
      {Key key,
      this.map,
      this.label,
      this.onChangeSelectMap,
      this.isExpanded,
      this.controller})
      : super(key: key);
  _SelectBoxState createState() => _SelectBoxState(
      map: map,
      label: label,
      onChangeSelectMap: onChangeSelectMap,
      isExpanded: isExpanded,
      controller: controller);
}

class _SelectBoxState extends State<SelectBox> {
  final List<DropdownMenuItem> dropDownList = [];
  final Map map;
  final String label;
  final Function onChangeSelectMap;
  var selectBoxvalue;
  final bool isExpanded;
  final TextEditingController controller;

  _SelectBoxState(
      {this.map,
      this.label,
      this.onChangeSelectMap,
      this.isExpanded,
      this.controller}) {
    map.forEach((k, v) {
      dropDownList.add(DropdownMenuItem<String>(
        value: k,
        child: new Text(v),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: new DropdownButton(
            //elevation: 20,
            isExpanded: isExpanded ?? true,
            items: dropDownList.toList(),
            hint: Text(Translations.of(context).text(label)),
            value: selectBoxvalue,
            onChanged: (value) {
              setState(() {
                selectBoxvalue = value;
              });

              if (controller != null) {
                controller.text = value;
              }

              if (onChangeSelectMap != null) {
                onChangeSelectMap(value);
              }
            }));
  }
} //select box

//select box bulder form a Url
class SelectFromUrl extends StatefulWidget {
  final String url;
  final String label;
  final Function onChangeSelectMap;
  final myhttp;
  final isExpanded;
  final controller;

  const SelectFromUrl(
      {Key key,
      this.url,
      this.label,
      this.onChangeSelectMap,
      this.myhttp,
      this.isExpanded,
      this.controller})
      : super(key: key);

  _SelectFromUrlState createState() => _SelectFromUrlState(
      myhttp: myhttp,
      url: url,
      label: label,
      onChangeSelectMap: onChangeSelectMap,
      isExpanded: this.isExpanded,
      controller: this.controller);
}

class _SelectFromUrlState extends State<SelectFromUrl> {
  List<DropdownMenuItem> dropDownList = [];
  final String url;
  final String label;
  final Function onChangeSelectMap;
  final myhttp;
  var selectBoxvalue;
  final isExpanded;
  final controller;

  var data;
  _SelectFromUrlState(
      {this.url,
      this.label,
      this.onChangeSelectMap,
      this.myhttp,
      this.isExpanded,
      this.controller});

  @override
  Widget build(BuildContext context) {
    if (dropDownList.length >= 1) {
      return Container(
        child: buildDropdownButtonFormField(context),
      );
    } else {
      var x = Container(
          child: FutureBuilder(
        future: myhttp.getNewHttpData(specificUrl: url),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text(
                  Translations.of(context).text("NothingToLoading") + "...");
            case ConnectionState.waiting:
              return Text(Translations.of(context).text("Loading") + "...");
            case ConnectionState.done:
            default:
              if (snapshot.hasError && !snapshot.hasData) {
                return Text(Translations.of(context).text("BadResponse"));
              }

              var response = snapshot.data;
              if (response != null && response.statusCode == 200) {
                Map responceToJson = jsonDecode(response.body);

                if (responceToJson == null) {
                  return Text(Translations.of(context).text("BadResponse"));
                }

                if (responceToJson["status"] != 200 &&
                    responceToJson["data"] != null) {
                  return Text(Translations.of(context).text("BadResponse"));
                } else {
                  List dt = responceToJson["data"]; //store data

                  dt.forEach((f) {
                    f = f.values;
                    dropDownList.add(DropdownMenuItem<String>(
                      value: f.first,
                      child: new Text(f.last),
                    ));
                  });

                  return buildDropdownButtonFormField(context);
                }
              } else {
                return Text(Translations.of(context).text("NoDataFound"));
              }
          }
        },
      ));

      setState(() {
        dropDownList = dropDownList;
      });
      return x;
    }
  }

  DropdownButtonFormField buildDropdownButtonFormField(BuildContext context) {
    String x = controller.text; //on update initial value
    x = x.trim();
    if (x != "" && x != null) {
      selectBoxvalue = x;
    }

    return new DropdownButtonFormField(
        items: dropDownList.toList(),
        hint: Text(Translations.of(context).text(label)),
        value: selectBoxvalue,
        onChanged: (value) {
          setState(() {
            selectBoxvalue = value;
          });

          if (controller != null) {
            controller.text = value;
          }

          if (onChangeSelectMap != null) {
            onChangeSelectMap(value);
          }
        });
  }
}
