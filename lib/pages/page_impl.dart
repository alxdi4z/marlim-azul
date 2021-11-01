import 'package:flutter/material.dart';

abstract class PageImpl extends StatefulWidget {
  final String path;
  final String title;
  final bool showInBar;
  final bool highlight;

  const PageImpl(
      {Key? key,
      required this.path,
      required this.title,
      required this.showInBar,
      required this.highlight})
      : super(key: key);

  @override
  State<PageImpl> createState();
}
