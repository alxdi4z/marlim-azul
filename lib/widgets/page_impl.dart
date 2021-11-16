import 'package:flutter/material.dart';

abstract class PageImpl extends StatefulWidget {
  final String? path;
  final String title;
  final bool visible;
  final String? subtitle;
  final String? assetPath;

  const PageImpl(
      {Key? key,
      this.path,
      required this.title,
      required this.visible,
      this.subtitle,
      this.assetPath})
      : super(key: key);

  @override
  State<PageImpl> createState();
}
