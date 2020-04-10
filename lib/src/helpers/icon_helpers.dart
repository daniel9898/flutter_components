import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.keyboard_arrow_right,
  'accessibility': Icons.accessibility_new,
  'folder_open': Icons.accessibility_new,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'slideshow': Icons.slideshow,
  'list': Icons.list,
};

Icon getIcon(String name) {
  return Icon(_icons[name], color: Colors.blue);
}
