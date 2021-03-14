
import 'package:flutter/material.dart';
import 'package:flutter_desktop_ui/testView.dart';

import 'Base/EventBus.dart';

class indexViewForDesktopController extends StatefulWidget {
  final arguments;

  const indexViewForDesktopController({Key? key, this.arguments}) : super(key: key);
  @override
  _indexViewForDesktopControllerState createState() => _indexViewForDesktopControllerState();
}

class _indexViewForDesktopControllerState extends State<indexViewForDesktopController> {
  int currentIndex = 0;
  final pageController = PageController();
  @override
  void initState() {
    super.initState();
    bus.on("BottomBarToggle", (object) {
      setState(() {
        currentIndex = object;
        pageController.jumpToPage(currentIndex);
      });
    });
  }

  void onTap(int index) {
    pageController.jumpToPage(index);
    bus.emit('pageController', index);
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }


  @override
  void deactivate() {
    var bool = ModalRoute.of(context)!.isCurrent;
    if (bool) {
      print('返回主页');
    }
  }

  @override
  void dispose() {
    super.dispose();
    bus.off("BottomBarToggle");
  }

  final pages = [
    StrategicEditPageHedgeViewController(arguments: {'title' : '1'},),
    StrategicEditPageHedgeViewController(arguments: {'title' : '12'},),
    StrategicEditPageHedgeViewController(arguments: {'title' : '13'},),
    StrategicEditPageHedgeViewController(arguments: {'title' : '14'},),
    StrategicEditPageHedgeViewController(arguments: {'title' : '15'},),
    StrategicEditPageHedgeViewController(arguments: {'title' : 'qq'},),
    // WalletViewController(),
    // TransactionViewController(),
  ];

  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      drawer: Drawer(
        child: Container(
          color:Colors.green,
          child: Text('11'),
        ),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  Expanded(
                    child: NavigationRail(
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (int index) {
                        setState(() {
                          print(index);
                          _selectedIndex = index;
                        });
                      },
                      leading: Column(
                        children: [
                          Container(
                            child: IconButton(
                              icon: Icon(
                                Icons.repeat_rounded,
                                size: 19,
                                color: Colors.grey[800],
                              ),
                              onPressed: () {
                                _scaffoldkey.currentState!.openDrawer();
                              },
                            ),
                            margin: EdgeInsets.only(bottom: 18),
                          ),
                        ],
                      ),
                      labelType: NavigationRailLabelType.none,
                      selectedIconTheme: IconThemeData(size: 19),
                      unselectedIconTheme: IconThemeData(
                        size: 19,
                        color: Colors.grey[500],
                      ),
                      destinations: [
                        NavigationRailDestination(
                          icon: Icon(
                            Icons.add,
                          ),
                          label: Text(''),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.baby_changing_station),
                          label: Text(''),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.clear),
                          label: Text(''),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.umbrella),
                          label: Text(''),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.settings),
                          label: Text(''),
                        ),
                      ],

                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(3),
                      ),

                    ),
                    onTap: (){
                      setState(() {
                        _selectedIndex = 5;
                      });
                    },
                  )
                ],
              ),
            ),
            Flexible(
                flex: 0,
                child: Container(
                  width: 0.8,
                  color: Colors.grey,
                )),
            Flexible(
              flex: 1,
              child: pages[_selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}
