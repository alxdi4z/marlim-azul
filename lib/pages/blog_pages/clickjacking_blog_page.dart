import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';

class ClickjackingBlogPage extends PageImpl {
  const ClickjackingBlogPage({Key? key})
      : super(
            key: key,
            title: "Clickjacking",
            visible: false,
            subtitle: "O que um click pode fazer com você",
            assetPath: "images/clickjacking.jpg");

  @override
  State<PageImpl> createState() => _ClickjackingBlogPageState();
}

class _ClickjackingBlogPageState extends State<ClickjackingBlogPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
    );
  }
}
