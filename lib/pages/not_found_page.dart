import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marlinazul_frontend/functions.dart';
import 'package:marlinazul_frontend/pages/home_page.dart';
import 'package:marlinazul_frontend/pages/page_custom_view.dart';
import 'package:marlinazul_frontend/pages/page_impl.dart';

import '../constants.dart';

const highlight = false;
const path = "/404";
const showInBar = false;
const title = "404";

class NotFoundPage extends PageImpl {
  const NotFoundPage({Key? key})
      : super(
          key: key,
          highlight: highlight,
          path: path,
          showInBar: showInBar,
          title: title,
        );

  @override
  State<PageImpl> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) =>
      PageCustomView(view: view(context), path: widget.path);

  Widget view(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool mobile = checkMobile(size.width);

    double height = size.height - (mobile ? mobileBarHeight : desktopBarHeight);
    return SizedBox(
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
                  child: SvgPicture.asset("images/door.svg",
                      placeholderBuilder: (context) => SizedBox(
                            child: CircularProgressIndicator(
                              color: Colors.white.withOpacity(0.3),
                            ),
                            height: size.height * .14,
                            width: size.height * .14,
                          ),
                      height: size.height * .25),
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
