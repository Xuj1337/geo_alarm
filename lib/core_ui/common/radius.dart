import 'package:flutter/material.dart';

extension KRadius on Radius {
  static const c4 = Radius.circular(4);
  static const c8 = Radius.circular(8);
  static const c12 = Radius.circular(12);
  static const c16 = Radius.circular(16);
  static const c20 = Radius.circular(20);
  static const c30 = Radius.circular(30);
}

extension KBorderRadius on BorderRadius {
  static const a4 = BorderRadius.all(KRadius.c4);
  static const a8 = BorderRadius.all(KRadius.c8);
  static const a12 = BorderRadius.all(KRadius.c12);
  static const a16 = BorderRadius.all(KRadius.c16);
  static const a20 = BorderRadius.all(KRadius.c20);
  static const a30 = BorderRadius.all(KRadius.c30);
  static const t20 = BorderRadius.vertical(top: KRadius.c20);
  static const b20 = BorderRadius.vertical(bottom: KRadius.c20);
}
