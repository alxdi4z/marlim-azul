import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/pages/page_custom_view.dart';
import 'package:marlinazul_frontend/pages/page_impl.dart';

const highlight = false;
const path = "/takecare";
const showInBar = true;
const title = "Cuide-se";

class TakeCarePage extends PageImpl {
  const TakeCarePage({Key? key})
      : super(
            key: key,
            highlight: highlight,
            path: path,
            showInBar: showInBar,
            title: title);

  @override
  State<PageImpl> createState() => _TakeCarePageState();
}

class _TakeCarePageState extends State<TakeCarePage> {
  @override
  Widget build(BuildContext context) =>
      PageCustomView(view: view(context), path: widget.path);

  Widget view(BuildContext context) {
    return Container();
  }
}
