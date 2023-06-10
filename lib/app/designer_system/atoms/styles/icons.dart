import 'package:flutter/material.dart';

mixin CustomIcons {
  static IconData get person => Icons.person;
  static IconData get lock => Icons.lock;
  static IconData get visibility => Icons.visibility;
  static IconData get visibilityOff => Icons.visibility_off;
  static IconData get check => Icons.check;
  static IconData get close => Icons.close;
  static IconData get back => Icons.arrow_back;
  static IconData get arrowForward => Icons.arrow_forward;
  static IconData get home => Icons.home;
  static IconData get search => Icons.search;
  static IconData get note => Icons.sticky_note_2;
  static IconData get cart => Icons.shopping_cart;
  static Icon get favorite => const Icon(Icons.favorite, color: Colors.red,);
  static Icon get favoriteBorder =>  const Icon(Icons.favorite_border, color: Colors.white,);
  static Icon get warning => const Icon(Icons.warning, color: Colors.amber,);
}
