import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/functions.dart';
import 'package:marlinazul_frontend/widgets/page_custom_view.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';
import 'package:marlinazul_frontend/widgets/logo.dart';
import 'package:marlinazul_frontend/widgets/row_box.dart';

const path = "/";
const title = "Home";
const showInBar = false;
const highlight = false;

class HomePage extends PageImpl {
  const HomePage({Key? key})
      : super(key: key, path: "/", title: "Home", visible: false);

  @override
  State<PageImpl> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => PageCustomView(
        view: view(context),
        path: widget.path,
        backButton: false,
      );

  Widget view(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool mobile = checkMobile(size.width);
    double height = size.height - desktopBarHeight;

    List<Widget> bloco1 = [
      SizedBox(
        width: mobile ? size.width * .9 : size.width * .5,
        child: Column(
          children: [
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: fontStyle(
                      fontSize * 1.9,
                      false,
                      bold: true,
                    ),
                    children: [
                      const TextSpan(text: "Não seja uma "),
                      TextSpan(
                          text: "presa ",
                          style: fontStyle(fontSize * 1.9, true, bold: true)),
                      const TextSpan(text: "fácil na internet"),
                    ])),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            RichText(
                text: TextSpan(
                    style: fontStyle(fontSize * 1.5, false, bold: true),
                    children: [
                  TextSpan(
                      text:
                          "Grande parte das pessoas não tem conhecimento de como "
                          "navegar na internet com segurança, por isso, acabam caindo "
                          "nos mais diversos tipos de ataques.",
                      style: fontStyle(fontSize, false))
                ]))
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: mobile ? 35 : 10, bottom: 10),
        child: SvgPicture.asset("images/cyber-attack.svg",
            placeholderBuilder: (context) => SizedBox(
                  child: CircularProgressIndicator(
                    color: Colors.white.withOpacity(0.3),
                  ),
                  height: mobile ? size.width * .4 : size.width * .2,
                  width: mobile ? size.width * .4 : size.width * .2,
                ),
            width: mobile ? size.width * .7 : size.width * .3),
      ),
    ];

    List<Widget> bloco2 = [
      Padding(
        padding: EdgeInsets.only(top: mobile ? 35 : 10, bottom: 10),
        child: SvgPicture.asset("images/crimes.svg",
            placeholderBuilder: (context) => SizedBox(
                  child: CircularProgressIndicator(
                    color: Colors.white.withOpacity(0.3),
                  ),
                  height: mobile ? size.width * .4 : size.width * .2,
                  width: mobile ? size.width * .4 : size.width * .2,
                ),
            width: mobile ? size.width * .7 : size.width * .3),
      ),
      SizedBox(
          width: mobile ? size.width * .9 : size.width * .4,
          child: Column(
            children: [
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(style: fontStyle(fontSize, false), children: [
                    TextSpan(
                        text: "Líder em crimes ",
                        style: fontStyle(fontSize * 1.9, false, bold: true)),
                    TextSpan(
                        text: "cibernéticos",
                        style: fontStyle(fontSize * 1.9, true, bold: true))
                  ])),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              RichText(
                  text: TextSpan(style: fontStyle(fontSize, false), children: [
                const TextSpan(
                    text:
                        "O Brasil é um dos países com o maior número de ataques "
                        "cibernéticos no mundo.\nDentre eles os mais comuns são "),
                TextSpan(
                    text:
                        "roubo de identidade, spoofing, phishing e clickjacking",
                    style: fontStyle(fontSize, true)),
                const TextSpan(text: ".\n"),
                const TextSpan(
                    text:
                        "No início do ano de 2021 foram vazados mais de 223 milhões de CPFs, "
                        "números de celulares, contas de e-mails, entre outros dados.\nEstes, sendo até colocados à venda na internet.")
              ]))
            ],
          )),
    ];

    List<Widget> bloco3 = [
      Padding(
        padding: EdgeInsets.only(bottom: mobile ? 35 : 10, top: 10),
        child: SvgPicture.asset("images/marlin_logo.svg",
            placeholderBuilder: (context) => SizedBox(
                  child: CircularProgressIndicator(
                    color: Colors.white.withOpacity(0.3),
                  ),
                  height: mobile ? size.width * .4 : size.width * .2,
                  width: mobile ? size.width * .4 : size.width * .2,
                ),
            width: mobile ? size.width * .7 : size.width * .3),
      ),
      SizedBox(
          width: mobile ? size.width * .9 : size.width * .5,
          child: Column(
            children: [
              logo(fontSize * 1.9),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              RichText(
                  text: TextSpan(style: fontStyle(fontSize, false), children: [
                const TextSpan(text: "O "),
                TextSpan(
                    text: "Marlim Azul ", style: fontStyle(fontSize, true)),
                const TextSpan(
                    text: "é um projeto que foi desenvolvido com o propósito "
                        "de instruir como navegar na internet com mais segurança.\n"
                        "Apresentando os tipos mais comuns de ataques e mostrando como "
                        "identificá-los e evitá-los.")
              ]))
            ],
          )),
    ];

    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        children: [
          RowBox(
              widgets: bloco1,
              width: size.width,
              height: !mobile ? height - (height * .2) : null),
          RowBox(
              widgets: mobile ? bloco2.reversed.toList() : bloco2,
              width: size.width,
              height: !mobile ? height - (height * .2) : null),
          RowBox(
              widgets: bloco3,
              width: size.width,
              height: !mobile ? height - (height * .2) : null),
        ],
      ),
    );
  }

  TextStyle fontStyle(double fontSize, bool highlight, {bool bold = false}) =>
      TextStyle(
          fontSize: fontSize,
          color: highlight ? primaryColor : Colors.white,
          fontFamily: "Righteous",
          fontWeight: bold ? FontWeight.bold : FontWeight.normal);
}
