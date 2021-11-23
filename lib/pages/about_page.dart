import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/functions.dart';
import 'package:marlinazul_frontend/widgets/page_custom_view.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';
import 'package:marlinazul_frontend/widgets/logo.dart';
import 'package:marlinazul_frontend/widgets/row_box.dart';

const highlight = false;
const path = "/about";
const showInBar = true;
const title = "Sobre";

class AboutPage extends PageImpl {
  const AboutPage({Key? key})
      : super(key: key, path: "/about", visible: true, title: "Sobre");

  @override
  State<PageImpl> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) => PageCustomView(
        view: view(context),
        path: widget.path,
        backButton: false,
      );

  Widget view(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool mobile = checkMobile(size.width);
    double padding = mobile ? size.width * .05 : size.width * .12;

    return Container(
      width: size.width,
      height: size.height - (mobile ? mobileBarHeight : desktopBarHeight),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(padding, 15, padding, 30),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.04),
                ),
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    SizedBox(
                      width: mobile ? size.width * .9 : size.width * .35,
                      child: const Text(
                        "Esse projeto foi criado como trabalho de conclusão de curso "
                        "para a instituição universitária Libertas Faculdades Integradas, "
                        "no curso de Sistemas de Informação.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize,
                            fontFamily: "Righteous"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight: size.height * .3,
                              minWidth: size.width * .35),
                          child: Image.asset(
                            "images/libertas_logo.png",
                            color: primaryColor,
                            height: size.height,
                          )),
                    ),
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 40),
                  child: Text(
                    "Tecnologias utilizadas:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSize * 1.2,
                        fontFamily: "Righteous"),
                    textAlign: TextAlign.center,
                  )),
              Wrap(
                    spacing: 20,
                    children: [
                      Image.asset("images/dart_icon.png",
                          // width: mobile ? size.width * .4 : size.width * .16
                        height: 128,
                      ),
                      Image.asset("images/flutter_icon.png",
                          // width: mobile ? size.width * .4 : size.width * .16
                        height: 128,
                      ),
                    ],
                  ),
              Padding(
                padding: const EdgeInsets.only(top: 90, bottom: 30),
                child: logo(fontSize * 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
