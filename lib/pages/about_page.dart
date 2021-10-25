import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/widgets/logo.dart';
import 'package:marlinazul_frontend/widgets/row_box.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool mobile = size.width <= 800;
    return view(mobile, size);
  }

  Widget view(bool mobile, Size size) {
    double width = mobile ? size.width : size.width * .7;

    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        children: [
          RowBox(widgets: [
            SizedBox(
              width: mobile ? width * .9 : width * .5,
              child: const Text(
                "\t\tEsse projeto foi criado como trabalho de conclusão de curso "
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
                      maxWidth: width * .4),
                  child: Image.asset(
                    "images/libertas_logo.png",
                    color: primaryColor,
                    height: size.height,
                  )),
            ),
          ], width: width),
          const Padding(
              padding: EdgeInsets.only(top: 30),
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
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: SvgPicture.asset(
                        "images/dart_icon.svg",
                        height: size.height,
                        placeholderBuilder: (context) => SizedBox(
                          child: CircularProgressIndicator(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: size.width * .4,
                        maxHeight: size.height * .15),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: SvgPicture.asset(
                        "images/flutter_icon.svg",
                        height: size.height,
                        placeholderBuilder: (context) => SizedBox(
                          child: CircularProgressIndicator(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                      ),
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
    );
  }
}
