import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';

class SpoofingBlogPage extends PageImpl {
  const SpoofingBlogPage({Key? key})
      : super(
            key: key,
            title: "Spoofing",
            visible: false,
            assetPath: "images/xg-spoofing.jpg",
            subtitle: "Não seja enganado");

  @override
  State<PageImpl> createState() => _SpoofingBlogPageState();
}

class _SpoofingBlogPageState extends State<SpoofingBlogPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
    );
  }
}
