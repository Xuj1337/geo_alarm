import 'package:flutter/material.dart';

extension KEdgeInsets on EdgeInsets {
  static const zero = EdgeInsets.zero;

  static const a4 = EdgeInsets.all(4);
  static const a6 = EdgeInsets.all(6);
  static const a8 = EdgeInsets.all(8);
  static const a12 = EdgeInsets.all(12);
  static const a16 = EdgeInsets.all(16);
  static const a20 = EdgeInsets.all(20);
  static const a24 = EdgeInsets.all(24);
  static const a32 = EdgeInsets.all(32);

  static const h4 = EdgeInsets.symmetric(horizontal: 4);
  static const h8 = EdgeInsets.symmetric(horizontal: 8);
  static const h16 = EdgeInsets.symmetric(horizontal: 16);
  static const h12 = EdgeInsets.symmetric(horizontal: 12);
  static const h24 = EdgeInsets.symmetric(horizontal: 24);
  static const h32 = EdgeInsets.symmetric(horizontal: 32);

  static const v4 = EdgeInsets.symmetric(vertical: 4);
  static const v6 = EdgeInsets.symmetric(vertical: 6);
  static const v8 = EdgeInsets.symmetric(vertical: 8);
  static const v12 = EdgeInsets.symmetric(vertical: 12);
  static const v16 = EdgeInsets.symmetric(vertical: 16);
  static const v20 = EdgeInsets.symmetric(vertical: 20);

  static const h4v12 = EdgeInsets.symmetric(horizontal: 4, vertical: 12);
  static const h8v2 = EdgeInsets.symmetric(horizontal: 8, vertical: 2);
  static const h8v4 = EdgeInsets.symmetric(horizontal: 8, vertical: 4);
  static const h12v4 = EdgeInsets.symmetric(horizontal: 12, vertical: 4);
  static const h12v6 = EdgeInsets.symmetric(horizontal: 12, vertical: 6);
  static const h12v8 = EdgeInsets.symmetric(horizontal: 12, vertical: 8);
  static const h12v16 = EdgeInsets.symmetric(horizontal: 12, vertical: 16);
  static const h16v12 = EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static const h16v4 = EdgeInsets.symmetric(horizontal: 16, vertical: 4);
  static const h16v8 = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const h16v24 = EdgeInsets.symmetric(horizontal: 16, vertical: 24);
  static const h16v20 = EdgeInsets.symmetric(horizontal: 16, vertical: 20);
  static const h20v16 = EdgeInsets.symmetric(horizontal: 20, vertical: 16);
  static const h36v24 = EdgeInsets.symmetric(horizontal: 36, vertical: 24);
  static const h8v16 = EdgeInsets.symmetric(horizontal: 8, vertical: 16);
  static const h6v16 = EdgeInsets.symmetric(horizontal: 6, vertical: 16);
  static const h8v12 = EdgeInsets.symmetric(horizontal: 8, vertical: 12);
  static const h8v10 = EdgeInsets.symmetric(horizontal: 8, vertical: 10);
  static const h6v12 = EdgeInsets.symmetric(horizontal: 6, vertical: 12);

  static const h16t8b16 = EdgeInsets.fromLTRB(16, 8, 16, 16);
  static const t8b16 = EdgeInsets.fromLTRB(0, 8, 0, 16);
  static const h16b16 = EdgeInsets.fromLTRB(16, 0, 16, 16);

  static const t16 = EdgeInsets.only(top: 16);
  static const b16 = EdgeInsets.only(bottom: 16);

  static a(double padding) => EdgeInsets.all(padding);
}
