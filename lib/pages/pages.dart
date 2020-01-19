import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pizzme/pages/homePage.dart';
import 'package:pizzme/pages/listPage.dart';
import 'package:pizzme/pages/otherPage.dart';
import 'package:pizzme/pages/settingPage.dart';
import 'package:pizzme/res/values.dart';
import 'package:swipedetector/swipedetector.dart';
import '../res/colori.dart';

class Pages extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int _page = 1;
  GlobalKey _bottomNavigationKey = GlobalKey();

  Values values = new Values();

  Colori _c = new Colori();

  final SettingPage _settingPage = new SettingPage();
  final HomePage _homePage = new HomePage();
  final ListPage _listPage = new ListPage();
  final OtherPage _otherPage = new OtherPage();

  Widget _showPage = new HomePage();
  Widget _pageSelector(int page) {
    switch (page) {
      case 0:
        return _listPage;
        break;
      case 1:
        return _homePage;
        break;
      case 2:
        return _settingPage;
        break;
      default:
        return _otherPage;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.decelerate,
        animationDuration: Duration(milliseconds: 450),
        key: _bottomNavigationKey,
        height: values.getNavBarHeigth(),
        index: _page,
        color: Colors.white,
        backgroundColor: _c.getStartGradient(),
        items: <Widget>[
          Icon(Icons.list, size: 30, color: Colors.black),
          Icon(Icons.home, size: 30, color: Colors.black),
          Icon(Icons.settings, size: 30, color: Colors.black),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            _showPage = _pageSelector(_page);
          });
        },
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
              _c.getStartGradient(),
              _c.getEndGradient(),
            ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                tileMode: TileMode.clamp)),
        child: SwipeDetector(
          child: _showPage,
          onSwipeLeft: (){
            if(_page < 2){
              setState(() {
                _page++;
                _showPage = _pageSelector(_page);
              });
            }
          },
          onSwipeRight: (){
            if(_page > 0){
              setState(() {
                _page--;
                _showPage = _pageSelector(_page);
              });
            }
          },
        ),
      ),
    );
  }
}
