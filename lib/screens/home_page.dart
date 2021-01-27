import 'package:emergency_app/screens/LocationPages.dart';
import 'package:emergency_app/screens/pageClients.dart';
import 'package:emergency_app/screens/pagePlaces.dart';
import 'package:emergency_app/screens/pageProducts.dart';
import 'package:emergency_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final PageProducts _listProducts =PageProducts();
  final PagePlaces _sites = new PagePlaces();
  final PageClients _clients = new PageClients();
  final LocationSearch _location = new LocationSearch();
  final SettingsScreen _screen = new SettingsScreen();
  Widget _showPage = new PageProducts();

  Widget _pageChooser(int pages){
    switch(pages){
      case 0:
      return _listProducts;
      break;
      case 1:
      return _sites;
      break;
      case 2:
      return _clients;
      break;
      case 3:
      return _location;
      break;
      case 4:
      return _screen;
      break;
      default:
      return new Container(
        child: new Center(child: new Text("No Page found", style: TextStyle(fontSize:4),),),
      );
    }
  }
  
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: pageIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.map, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.location_searching, size: 30),
            Icon(Icons.settings, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.pink[100],
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.pink[50],
          child: Center(
            child: _showPage,
            //child: Text(_page.toString(), textScaleFactor: 10.0),
        )));
  }
}
