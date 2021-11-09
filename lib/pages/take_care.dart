import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/functions.dart';
import 'package:marlinazul_frontend/widgets/card_content_viewer.dart';
import 'package:marlinazul_frontend/widgets/custom_card.dart';
import 'package:marlinazul_frontend/widgets/page_custom_view.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';

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
            visible: showInBar,
            title: title);

  @override
  State<PageImpl> createState() => _TakeCarePageState();
}

class _TakeCarePageState extends State<TakeCarePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      PageCustomView(view: view(context), path: widget.path);

  Widget view(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool mobile = checkMobile(size.width);
    return Padding(
      padding: const EdgeInsets.all(20),
      // child: CustomCard(
      //     title: "Phishing",
      //     subtitle: "Phishing e como se defender",
      //     description:
      //         "Aprenda a se defender do phishing da melhor maneira possível",
      //     width: size.width * .3,
      //     logoUrl: "images/phishing.jpg",
      //     height: 800,
      //     onClick: () {}),
      child: Container(),
    );
  }
}
