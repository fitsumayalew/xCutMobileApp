import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xcut_frontend/src/screens/bookmark.dart';
import 'package:xcut_frontend/src/screens/home.dart';
import 'package:xcut_frontend/src/screens/profile.dart';

/// This is the stateful widget that the main application instantiates.
class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

/// This is the private State class that goes with App.
class _AppState extends State<App> {
  int _currentIndex = 0;

  _onTap(int index) {
    setState(() => {_currentIndex = index});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: bodyNavigator(context, _currentIndex),
        bottomNavigationBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height / 11),
          child: CupertinoTabBar(
              currentIndex: _currentIndex,
              backgroundColor: Theme.of(context).primaryColorDark,
              // type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                ),
                BottomNavigationBarItem(icon: Icon(Icons.archive_outlined)),
                BottomNavigationBarItem(icon: Icon(Icons.account_box_outlined))
              ],
              border: Border(
                  top: BorderSide(width: 0.5, color: Colors.grey.shade400)),
              activeColor: Theme.of(context).primaryColor,
              onTap: _onTap),
        ));
  }
}

Widget bodyNavigator(BuildContext context, int index) {
  List<Widget> _children = [Home(), BookMark(), Profile()];
  return _children[index];
}
