import 'package:flutter/material.dart' show IconData; //no es necesario porque ya está en el views
import 'package:flutterprueba/views/views.dart';

class MenuOption{

  final String route;
  final IconData icon;
  final String name;
  final Widget screen;

  MenuOption({
    required this.route,
    required this.icon,
    required this.name,
    required this.screen
  });



}