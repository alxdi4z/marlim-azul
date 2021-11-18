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
    double padding = mobile ? size.width * .05 : size.width * .07;

    return SingleChildScrollView(
      controller: ScrollController(),
      child: Padding(
        padding: EdgeInsets.fromLTRB(padding, 15, padding, 30),
        child: Column(
          children: [
            RowBox(widgets: [
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
                padding: const EdgeInsets.all(20),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: mobile ? size.height * .3 : size.height * .2,
                        maxWidth: size.width * .3),
                    child: Image.asset(
                      "images/libertas_logo.png",
                      color: primaryColor,
                      height: size.height,
                    )),
              ),
            ], width: size.width),
            const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                child: Text(
                  "Tecnologias utilizadas:",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontFamily: "Righteous"),
                  textAlign: TextAlign.center,
                )),
            Padding(
                padding: const EdgeInsets.only(bottom: fontSize * 1.2),
                child: Wrap(
                  spacing: 20,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: size.width * .4,
                          maxHeight: size.height * .15),
                      child: Image.asset(
                        "images/dart_icon.png",
                        height: size.height,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: size.width * .4,
                          maxHeight: size.height * .15),
                      child: Image.asset(
                        "images/flutter_icon.png",
                        height: size.height,
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 90, bottom: 30),
              child: logo(fontSize * 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
