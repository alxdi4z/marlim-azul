import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/widgets/page_custom_view.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';

class MoreToComePage extends PageImpl {
  const MoreToComePage({Key? key})
      : super(
            key: key,
            title: "Há mais por vir...",
            visible: false,
            assetPath: "images/horizon.jpg",
            subtitle: "Novos módulos serão adicionados em breve");

  @override
  _MoreToComePageState createState() => _MoreToComePageState();
}

class _MoreToComePageState extends State<MoreToComePage> {
  @override
  Widget build(BuildContext context) =>
      PageCustomView(view: view(context), backButton: true);

  Widget view(BuildContext context) {
    return Container();
  }
}
