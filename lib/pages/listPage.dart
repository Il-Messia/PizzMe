import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pizzme/res/colori.dart';
import 'package:pizzme/res/values.dart';
import 'package:pizzme/util/drinkManager.dart';
import 'package:pizzme/util/pizzaManager.dart';
import 'package:pizzme/util/sharedManager.dart';
import 'package:url_launcher/url_launcher.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Values values = new Values();

  List<PizzaManager> listPizza = new List<PizzaManager>();
  List<DrinkManager> listDrink = new List<DrinkManager>();

  int cont1;

  @override
  void initState() {
    super.initState();
    PizzaManager p = new PizzaManager('Salsiccia', 5);
    listPizza.add(p);
    listPizza.add(p);
    listPizza.add(p);
    listPizza.add(p);
    listDrink.add(new DrinkManager('Coca', 5));
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      print("Opening url");
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: new EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
        decoration: new BoxDecoration(
            color: Colori.darkTheme
                ? Colori.darkThemePrimaryColorDark
                : Colori.lightThemePrimaryColorLight,
            borderRadius: new BorderRadius.all(Radius.circular(15.0)),
            boxShadow: [
              new BoxShadow(
                  color: Colors.black38,
                  blurRadius: 5.0,
                  spreadRadius: 5.0,
                  offset: Offset(0.0, 5.0))
            ]),
        child: new Container(
            width: MediaQuery.of(context).size.width,
            child: new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Container(
                        margin: EdgeInsets.only(
                            top: 15.0, left: 15.0, bottom: 15.0),
                        child: new Text(
                          'Pizze:',
                          style: new TextStyle(
                              color: Colori.darkTheme
                                  ? Colors.white
                                  : Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                new SizedBox(
                  height: 150.0,
                  child: ListView.builder(
                    itemCount: listPizza.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colori.darkTheme
                            ? Colori.darkThemePrimaryColorLight
                            : Colori.lightThemePrimaryColorLight,
                        child: InkWell(
                          onTap: (){
                            setState(() {
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              listPizza[index].toString(),
                              style: TextStyle(fontSize: 22.0),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                new Row(
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.only(
                          top: 15.0,
                          left: MediaQuery.of(context).size.width - 100.0),
                      child: new FloatingActionButton(
                        onPressed: () {},
                        child: new Icon(Icons.add),
                        backgroundColor: Colori.darkTheme
                            ? Colori.endGradient
                            : Colori.startGradient,
                        focusColor: Colori.darkTheme
                            ? Colori.startGradient
                            : Colori.endGradient,
                        splashColor: Colori.darkTheme
                            ? Colori.startGradient
                            : Colori.endGradient,
                        elevation: 5.0,
                      ),
                    )
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Container(
                        margin: EdgeInsets.only(
                            top: 15.0, left: 15.0, bottom: 15.0),
                        child: new Text(
                          'Bibite:',
                          style: new TextStyle(
                              color: Colori.darkTheme
                                  ? Colors.white
                                  : Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                new SizedBox(
                  height: 150.0,
                  child: ListView.builder(
                    itemCount: listDrink.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colori.darkTheme
                            ? Colori.darkThemePrimaryColorLight
                            : Colori.lightThemePrimaryColorLight,
                        child: InkWell(
                          onTap: (){
                            setState(() {
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              listDrink[index].toString(),
                              style: TextStyle(fontSize: 22.0),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                new Row(
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width - 100.0),
                      child: new FloatingActionButton(
                        onPressed: () {},
                        child: new Icon(Icons.add),
                        focusColor: Colori.darkTheme
                            ? Colori.startGradient
                            : Colori.endGradient,
                        splashColor: Colori.darkTheme
                            ? Colori.startGradient
                            : Colori.endGradient,
                        backgroundColor: Colori.darkTheme
                            ? Colori.endGradient
                            : Colori.startGradient,
                        elevation: 5.0,
                      ),
                    )
                  ],
                ),
                new Wrap(
                  spacing: 20.0, // gap between adjacent chips
                  runSpacing: 4.0, // gap between lines
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.delete),
                      focusColor: Colori.darkTheme
                          ? Colori.startGradient
                          : Colori.endGradient,
                      splashColor: Colori.darkTheme
                          ? Colori.startGradient
                          : Colori.endGradient,
                      backgroundColor: Colori.darkTheme
                          ? Colori.endGradient
                          : Colori.startGradient,
                      elevation: 5.0,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.sms),
                      focusColor: Colori.darkTheme
                          ? Colori.startGradient
                          : Colori.endGradient,
                      splashColor: Colori.darkTheme
                          ? Colori.startGradient
                          : Colori.endGradient,
                      backgroundColor: Colori.darkTheme
                          ? Colori.endGradient
                          : Colori.startGradient,
                      elevation: 5.0,
                    ),
                    FloatingActionButton(
                      onPressed: () async {
                        var phone = await SharedManager.getPhoneNumber();
                        if (phone == '00000000000') {
                          Fluttertoast.showToast(
                              msg:
                                  "Prima di chiamare bisogna selezionare una pizzeria",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                              fontSize: 16.0);
                        } else {
                          var phone1 = 'tel:$phone';
                          this._launchURL(phone1);
                        }
                      },
                      child: Icon(Icons.call),
                      focusColor: Colori.darkTheme
                          ? Colori.startGradient
                          : Colori.endGradient,
                      splashColor: Colori.darkTheme
                          ? Colori.startGradient
                          : Colori.endGradient,
                      backgroundColor: Colori.darkTheme
                          ? Colori.endGradient
                          : Colori.startGradient,
                      elevation: 5.0,
                    )
                  ],
                )
              ],
            )));
  }
}
