import 'package:flutter/material.dart';
import 'package:flutter_novel/public.dart';

import 'package:flutter_novel/app/root_scene.dart';


final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class AppScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShuQi',
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        dividerColor: Color(0xffeeeeee),
        scaffoldBackgroundColor: SQColor.paper,
        textTheme: TextTheme(body1: TextStyle(color: SQColor.darkGray)),
      ),
      home: RootScene(),
    );
  }
}