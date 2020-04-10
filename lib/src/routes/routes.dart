import 'package:flutter/material.dart';

import 'package:componentes/src/pages/Home.dart';
import 'package:componentes/src/pages/alert.dart';
import 'package:componentes/src/pages/avatar.dart';
import 'package:componentes/src/pages/card.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/input.dart';
import 'package:componentes/src/pages/slider.dart';
import 'package:componentes/src/pages/list.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'input': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListPage()
  };
}
