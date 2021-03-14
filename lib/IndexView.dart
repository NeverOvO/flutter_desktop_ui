import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_desktop_ui/testView.dart';

import 'Base/EventBus.dart';


class indexViewController extends StatefulWidget {
  final arguments;

  const indexViewController({Key? key, this.arguments}) : super(key: key);
  @override
  _indexViewControllerState createState() => _indexViewControllerState();
}

class _indexViewControllerState extends State<indexViewController> {
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
    StrategicEditPageHedgeViewController(),
    StrategicEditPageHedgeViewController(),
    StrategicEditPageHedgeViewController(),
    StrategicEditPageHedgeViewController(),
    StrategicEditPageHedgeViewController(),
    // WalletViewController(),
    // TransactionViewController(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: pageController,
        children: pages,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(), // 禁止滑动
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Icon(Icons.baby_changing_station),
            activeIcon: Icon(Icons.baby_changing_station),
            label: "消息",//title: Text("消息",style: TextStyle(color: currentIndex == 0 ? Colors.white : Colors.grey),),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Icon(Icons.baby_changing_station),
            activeIcon: Icon(Icons.baby_changing_station),
            label: "溢价",//title: Text("溢价",style: TextStyle(color: currentIndex == 1 ? Colors.white : Colors.grey),),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Icon(Icons.baby_changing_station),
            activeIcon: Icon(Icons.baby_changing_station),
            label: "管控",//title: Text("管控",style: TextStyle(color: currentIndex == 2 ? Colors.white : Colors.grey),),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Icon(Icons.baby_changing_station),
            activeIcon: Icon(Icons.baby_changing_station),
            label: "统计",//title: Text("统计",style: TextStyle(color: currentIndex == 3 ? Colors.white : Colors.grey),),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Icon(Icons.baby_changing_station),
            activeIcon: Icon(Icons.baby_changing_station),
            label: "我的",//title: Text("我的",style: TextStyle(color: currentIndex == 4 ? Colors.white : Colors.grey),),
          ),
          // BottomNavigationBarItem(
          //   backgroundColor: Colors.transparent,
          //   icon: Image.asset('images/TabBar_wallet-front.png'),
          //   activeIcon: Image.asset('images/TabBar_wallet-after.png'),
          //   label: "资产",//title: Text("我的",style: TextStyle(color: currentIndex == 4 ? Colors.white : Colors.grey),),
          // ),
          // BottomNavigationBarItem(
          //   backgroundColor: Colors.transparent,
          //   icon: Image.asset('images/TarBar_transaction-front.png'),
          //   activeIcon: Image.asset('images/TarBar_transaction-after.png'),
          //   label: "交易",//title: Text("我的",style: TextStyle(color: currentIndex == 4 ? Colors.white : Colors.grey),),
          // ),
        ],
        currentIndex: currentIndex,
        backgroundColor: Color.fromRGBO(37, 50, 58, 1),
        type: BottomNavigationBarType.fixed,
        selectedFontSize :12.0,
        selectedItemColor: Colors.white,
        unselectedFontSize : 12.0,
        unselectedItemColor: Colors.grey,
        onTap: onTap,
      ),
    );
  }
}
