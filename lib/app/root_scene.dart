import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_novel/public.dart';


/// Root Scene
class RootScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RootSceneState();
}

/// Root Scene State
class RootSceneState extends State<RootScene> {
  int _tabIndex = 1;
  bool isFinishSetup = false;
  List<Image> _tabImages = [
    Image.asset('img/tab_bookshelf_n.png'),
    Image.asset('img/tab_bookstore_n.png'),
    Image.asset('img/tab_me_n.png'),
  ];
  List<Image> _tabSelectedImages = [
    Image.asset('img/tab_bookshelf_p.png'),
    Image.asset('img/tab_bookstore_p.png'),
    Image.asset('img/tab_me_p.png'),
  ];

  @override
  void initState() {
    super.initState();

    setupApp();
    /// Commented by Jinchao, don't know what eventBus is used for
    /*
    eventBus.on(EventUserLogin, (arg) {
      setState(() {});
    });

    eventBus.on(EventUserLogout, (arg) {
      setState(() {});
    });

    eventBus.on(EventToggleTabBarIndex, (arg) {
      setState(() {
        _tabIndex = arg;
      });
    });
    */
  }

  @override
  void dispose() {
    /// Commented by Jinchao, don't know what eventBus is used for
//    eventBus.off(EventUserLogin);
//    eventBus.off(EventUserLogout);
//    eventBus.off(EventToggleTabBarIndex);
    super.dispose();
  }

  setupApp() async {
    /// Commented by Jinchao, don't know what shared_preferences is used for
    // var preferences = await SharedPreferences.getInstance();
    setState(() {
      isFinishSetup = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isFinishSetup) {
      return Container();
    }

    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          /// Here Need to change Text into Scene
          /*
          BookshelfScene(),
          HomeScene(),
          MeScene(),
          */
          Text("BookShelf"),
          Text("HomeScene"),
          Text("MeScene")
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: SQColor.primary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), title: Text('书架')),
          BottomNavigationBarItem(icon: getTabIcon(1), title: Text('书城')),
          BottomNavigationBarItem(icon: getTabIcon(2), title: Text('我的')),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

  Image getTabIcon(int index) {
    if (index == _tabIndex) {
      return _tabSelectedImages[index];
    } else {
      return _tabImages[index];
    }
  }
}

