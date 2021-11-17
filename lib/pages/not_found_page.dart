import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/functions.dart';
import 'package:marlinazul_frontend/pages/home_page.dart';
import 'package:marlinazul_frontend/widgets/page_custom_view.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';

import '../constants.dart';

const highlight = false;
const path = "/404";
const showInBar = false;
const title = "404";

class NotFoundPage extends PageImpl {
  const NotFoundPage({Key? key})
      : super(
          key: key,
          path: path,
          visible: showInBar,
          title: title,
        );

  @override
  State<PageImpl> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) => PageCustomView(
        view: view(context),
        path: widget.path,
        backButton: false,
      );

  Widget view(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool mobile = checkMobile(size.width);

    double height = size.height - (mobile ? mobileBarHeight : desktopBarHeight);
    return Container(
        alignment: Alignment.center,
        height: height,
        width: size.width,
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: size.height * .3),
                child: SizedBox(
                    width: size.width * .8,
                    child: const FittedBox(
                      child: Text(
                        "404",
                        style: TextStyle(
                          color: primaryColor,
                          fontFamily: "PixelEmulator",
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(3.0, 3.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: InkWell(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  hoverColor: primaryColor.withOpacity(0.1),
                  highlightColor: primaryColor.withOpacity(0.6),
                  onTap: () =>
                      Navigator.pushNamed(context, getRoute(const HomePage())),
                  child:
                      Image.asset("images/door.png", height: size.height * .25),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: Text(
                  "Nada para ver aqui...",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize * 1.7,
                    fontFamily: "Righteous",
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
