import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop_ui/IndexViewForDesktop.dart';
import 'package:flutter_desktop_ui/testView.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'Base/EventBus.dart';
import 'Base/routes.dart';
import 'IndexView.dart';

Future<Null> main() async {
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {


  ThemeMode _themeMode = ThemeMode.light;
  @override
  initState() {
    WidgetsBinding.instance!.addObserver(this);
    bus.on('balck', (object) {
      setState(() {
        if(_themeMode == ThemeMode.light){
          _themeMode = ThemeMode.dark;
        }else{
          _themeMode = ThemeMode.light;
        }
      });
    });
  }



  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.inactive: // 处于这种状态的应用程序应该假设它们可能在任何时候暂停。
        break;
      case AppLifecycleState.resumed: // 应用程序可见，前台
        break;
      case AppLifecycleState.paused: // 应用程序不可见，后台
        break;
    }
  }



  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Neumorphic App',
      themeMode: _themeMode,
      theme: NeumorphicThemeData(
        baseColor: Colors.white,
        accentColor: Colors.green,//强调颜色
        lightSource: LightSource.topLeft,
        depth: 8,
        intensity: 0.9,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        appBarTheme: NeumorphicAppBarThemeData(
          icons: NeumorphicAppBarIcons(
            backIcon: Icon(Icons.chevron_left),
            closeIcon: Icon(Icons.clear)
          ),
          buttonStyle:NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
            depth: 4,
            intensity: 0.9,
          ),
        ),
      ),
      darkTheme: NeumorphicThemeData.dark(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        lightSource: LightSource.topLeft,
        depth: 4,
        intensity: 0.6,
        shadowLightColor: Colors.white38,
        shadowDarkColor: Colors.black,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
        appBarTheme: NeumorphicAppBarThemeData(
          icons: NeumorphicAppBarIcons(
              backIcon: Icon(Icons.chevron_left),
              closeIcon: Icon(Icons.clear)
          ),
          buttonStyle:NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
            depth: 4,
            intensity: 0.6,
          ),
        ),
      ),
      navigatorKey: navigatorKey,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      onGenerateRoute: onGenerateRoute,
      home: (Platform.isAndroid || Platform.isIOS) ?  indexViewController() : indexViewForDesktopController(),
    );
  }
}
