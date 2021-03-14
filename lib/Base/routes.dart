
import 'package:flutter/material.dart';

import '../IndexView.dart';
import '../testView.dart';

final routes = {
  //密码登录页面
  // '/LoginViewController': (context, {arguments}) => LoginViewController(arguments: arguments),

  '/indexViewController': (context, {arguments}) =>indexViewController(arguments: arguments),

  '/StrategicEditPageHedgeViewController': (context, {arguments}) =>StrategicEditPageHedgeViewController(arguments: arguments),



};

// ignore: top_level_function_literal_block, missing_return
var onGenerateRoute = (RouteSettings settings){
  final String? name = settings.name;

  final Function? pageContentBuilder = routes[name];

  if (settings.arguments != null) {
    final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder!(context, arguments: settings.arguments),
    );
    return route;
  } else {
    final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder!(context));
    return route;
  }
};