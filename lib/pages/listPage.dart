/*-------------------------------------------------------------------------------
  Created by Alex De Leo
  GitHub: https://github.com/Il-Messia
  Description: Simple app created through the Flutter framework. It allows the 
               ordering of pizzas for takeaway by message or call.
 ------------------------------------------------------------------------------*/
 /*-------------------------------------------------------------------------------
  ------------------------------------------------------------------------------*/

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pizzme/res/colori.dart';
import 'package:pizzme/res/values.dart';
import 'package:pizzme/util/drinkManager.dart';
import 'package:pizzme/util/pizzaManager.dart';
import 'package:pizzme/util/sharedManager.dart';
import 'package:pizzme/util/smsManager.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
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

  Widget auxl1;
  Widget auxl2;

  SmsManager sms = new SmsManager();

  final gusto = new TextEditingController();
  final nPizze = new TextEditingController();
  final drink = new TextEditingController();
  final nameController = new TextEditingController();
  
  double _height = 0.0;

  bool _getHeight(){
    _height = MediaQuery.of(context).size.height / 5;
    return true;
  }
  bool _getButtonHeight(){
    print(MediaQuery.of(context).size.height);
    if(MediaQuery.of(context).size.height <= 600){
      return true;
    }
    return false;
  }

  void _addPizza(String g, int n) {
    listPizza.add(new PizzaManager(g, n));
  }

  void _adddrink(String d, int n) {
    listDrink.add(new DrinkManager(d, n));
  }

  void _showAddPizzaAlert() {
    var alertStyle = AlertStyle(
        backgroundColor: Colori.darkTheme
            ? Colori.darkThemePrimaryColorDark
            : Colori.lightThemePrimaryColorLight,
        animationType: AnimationType.fromBottom,
        alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(
                color: Colori.darkTheme
                    ? Colori.darkThemePrimaryColorDark
                    : Colori.lightThemePrimaryColorLight)),
        titleStyle:
            TextStyle(color: Colori.darkTheme ? Colors.white : Colors.black),
        descStyle:
            TextStyle(color: Colori.darkTheme ? Colors.white : Colors.black));
    Alert(
      context: context,
      title: "Aggiungi pizza",
      style: alertStyle,
      desc: "Inserire il gusto e il numero di pizze",
      content: Column(
        children: <Widget>[
          TextField(
            controller: gusto,
            decoration:
                InputDecoration(labelText: 'Gusto: ', hintText: 'Salsiccia'),
          ),
          TextField(
            controller: nPizze,
            decoration: InputDecoration(labelText: 'Numero: ', hintText: '5'),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          child: Text(
            "Annulla",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          gradient: LinearGradient(
              colors: [Colori.startGradient, Colori.endGradient]),
          width: 120,
        ),
        DialogButton(
          child: Text(
            "Okay",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            this._addPizza(gusto.text, int.parse(nPizze.text));
            nPizze.text = "";
            gusto.text = "";
            setState(() {
              auxl1 = this.listViewPizza();
            });
            Navigator.pop(context);
          },
          gradient: LinearGradient(
              colors: [Colori.startGradient, Colori.endGradient]),
          width: 120,
        )
      ],
    ).show();
  }

  void _showAddDrinkAlert() {
    var alertStyle = AlertStyle(
        backgroundColor: Colori.darkTheme
            ? Colori.darkThemePrimaryColorDark
            : Colori.lightThemePrimaryColorLight,
        animationType: AnimationType.fromBottom,
        alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(
                color: Colori.darkTheme
                    ? Colori.darkThemePrimaryColorDark
                    : Colori.lightThemePrimaryColorLight)),
        titleStyle:
            TextStyle(color: Colori.darkTheme ? Colors.white : Colors.black),
        descStyle:
            TextStyle(color: Colori.darkTheme ? Colors.white : Colors.black));
    Alert(
      context: context,
      title: "Aggiungi drink",
      style: alertStyle,
      desc: "Inserire la bibita e il numero:",
      content: Column(
        children: <Widget>[
          TextField(
            controller: drink,
            decoration:
                InputDecoration(labelText: 'Bibita: ', hintText: 'Coca Cola'),
          ),
          TextField(
            controller: nPizze,
            decoration: InputDecoration(labelText: 'Numero: ', hintText: '5'),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          child: Text(
            "Annulla",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          gradient: LinearGradient(
              colors: [Colori.startGradient, Colori.endGradient]),
          width: 120,
        ),
        DialogButton(
          child: Text(
            "Okay",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            this._adddrink(drink.text, int.parse(nPizze.text));
            setState(() {
              auxl2 = this.listViewDrink();
            });
            Navigator.pop(context);
          },
          gradient: LinearGradient(
              colors: [Colori.startGradient, Colori.endGradient]),
          width: 120,
        )
      ],
    ).show();
  }

  void _showClearAlert() {
    var alertStyle = AlertStyle(
        backgroundColor: Colori.darkTheme
            ? Colori.darkThemePrimaryColorDark
            : Colori.lightThemePrimaryColorLight,
        animationType: AnimationType.fromBottom,
        alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(
                color: Colori.darkTheme
                    ? Colori.darkThemePrimaryColorDark
                    : Colori.lightThemePrimaryColorLight)),
        titleStyle:
            TextStyle(color: Colori.darkTheme ? Colors.white : Colors.black),
        descStyle:
            TextStyle(color: Colori.darkTheme ? Colors.white : Colors.black));
    Alert(
      context: context,
      type: AlertType.warning,
      title: "ATTENZIONE",
      style: alertStyle,
      desc: "Sicuro di voler eliminare tutte e due le liste?",
      buttons: [
        DialogButton(
          child: Text(
            "Annulla",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          gradient: LinearGradient(
              colors: [Colori.startGradient, Colori.endGradient]),
          width: 120,
        ),
        DialogButton(
          child: Text(
            "Okay",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            this._clearAll();
            Navigator.pop(context);
          },
          gradient: LinearGradient(
              colors: [Colori.startGradient, Colori.endGradient]),
          width: 120,
        )
      ],
    ).show();
  }

  void _clearAll() {
    listDrink.clear();
    listPizza.clear();
    setState(() {
      auxl1 = listViewPizza();
      auxl2 = listViewDrink();
    });
  }

  _showSnackBar(contex, PizzaManager pizzaManager, index) {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: Text(pizzaManager.toString()),
      action: SnackBarAction(
        label: 'ANNULLA',
        onPressed: (){
          listPizza.insert(index, pizzaManager);
          setState(() {
            auxl1 = listViewPizza();
          });
        },
      ),
    ));
  }

  showSnackBar(contex, DrinkManager drinkManager, index) {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: Text(drinkManager.toString()),
      action: SnackBarAction(
        label: 'UNDO',
        onPressed: (){
          listDrink.insert(index, drinkManager);
          setState(() {
            auxl2 = listViewDrink();
          });
        },
      ),
    ));
  }

  Widget listViewDrink() {
    return ListView.builder(
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
          child: Dismissible(
            key: Key(listDrink[index].toString()),
            background: refreshBg(),
            onDismissed: (direction) {
              var aux = listDrink[index];
              listDrink.removeAt(index);
              setState(() {
                auxl2 = listViewDrink();
              });
              showSnackBar(context, aux, index);
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
    );
  }

  Widget refreshBg() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.redAccent,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  Widget listViewPizza() {
    return ListView.builder(
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
          child: Dismissible(
            key: Key(listPizza[index].toString()),
            background: refreshBg(),
            onDismissed: (direction) {
              var aux = listPizza[index];
              listPizza.removeAt(index);
              setState(() {
                auxl1 = listViewPizza();
              });
              _showSnackBar(context, aux, index);
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
    );
  }

  @override
  void initState() {
    super.initState();
    auxl1 = listViewPizza();
    auxl2 = listViewDrink();
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      print("Opening url");
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void showAlert() {
    var alertStyle = AlertStyle(
        backgroundColor: Colori.darkTheme
            ? Colori.darkThemePrimaryColorDark
            : Colori.lightThemePrimaryColorLight,
        animationType: AnimationType.fromBottom,
        animationDuration: Duration(microseconds: 600),
        alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(
                color: Colori.darkTheme
                    ? Colori.darkThemePrimaryColorDark
                    : Colori.lightThemePrimaryColorLight)),
        titleStyle: TextStyle(
            color: Colori.darkTheme ? Colors.white : Colors.black,
            fontFamily: 'Roboto',
            fontSize: 30.0));
    Alert(
        title: '',
        type: AlertType.info,
        context: context,
        style: alertStyle,
        content: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  labelText: 'Nome: ',
                  hintText: 'Mario'),
              cursorColor: Colori.darkTheme ? Colors.white : Colors.black,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              SharedManager.setName(nameController.text);
              Navigator.pop(context);
            },
            child: Text(
              "SALVA",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'Roboto'),
            ),
          )
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: new EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
        decoration: new BoxDecoration(
            color: Colori.darkTheme
                ? Colori.darkThemePrimaryColorDark
                : Colori.lightThemePrimaryColorDark,
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
                  height: _getHeight() ? _height : _height,
                  child: auxl1,
                ),
                new Row(
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width - 100.0),
                      child: new FloatingActionButton(
                        mini: _getButtonHeight(),
                        onPressed: () {
                          this._showAddPizzaAlert();
                        },
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
                  height:  _getHeight() ? _height : _height,
                  child: auxl2,
                ),
                new Row(
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width - 100.0),
                      child: new FloatingActionButton(
                        mini: _getButtonHeight(),
                        onPressed: () {
                          this._showAddDrinkAlert();
                        },
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
                      mini: _getButtonHeight(),
                      onPressed: () {
                        this._showClearAlert();
                      },
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
                      mini: _getButtonHeight(),
                      onPressed: () async {
                        var n = await SharedManager.getOrderNumberFromShared();
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
                          //SharedManager.setOrder(n + 1);
                          var method = await SharedManager.getMethod();
                          if (method == 'null') {
                            Fluttertoast.showToast(
                                msg:
                                    "Prima di chiamare bisogna selezionare una pizzeria",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIos: 1,
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                                fontSize: 16.0);
                          } else if (method != 'Messaggio') {
                            Fluttertoast.showToast(
                                msg:
                                    "La pizzeria da te scelta non supporta ordinazioni tramite messaggio",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIos: 1,
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                                fontSize: 16.0);
                          } else {
                            String msg = "";
                            msg += "Pizze:\n";
                            for (int i = 0; i < listPizza.length; i++) {
                              msg += listPizza[i].toString();
                              msg += "\n";
                            }
                            msg += "------------------------\n";
                            msg += "Bibite:\n";
                            for (int i = 0; i < listDrink.length; i++) {
                              msg += listDrink[i].toString();
                              msg += "\n";
                            }
                            msg += "------------------------\n";
                            msg += "Nome: ";
                            var user = await SharedManager.getNameFromShared();
                            if (user == 'User') {
                              showAlert();
                            }
                            msg += user;
                            sms.setMessage(msg);
                            sms.setRecipents([phone]);
                            sms.sendSMS();
                          }
                        }
                      },
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
                      mini: _getButtonHeight(),
                      onPressed: () async {
                        var n = await SharedManager.getOrderNumberFromShared();
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
                          SharedManager.setOrder(n + 1);
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
