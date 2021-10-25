import 'package:flutter/material.dart';

class PageInfo {
  final String path;
  final Widget page;
  final String title;
  final bool showInBar;
  final bool highlight;

  const PageInfo(
      {required this.path,
      required this.page,
      required this.title,
      required this.showInBar,
      required this.highlight});
}
