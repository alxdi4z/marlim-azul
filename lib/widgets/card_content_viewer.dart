import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/functions.dart';
import 'package:marlinazul_frontend/pages/take_care.dart';

class CardContentViewer extends StatelessWidget {
  final String title;
  final Widget content;

  const CardContentViewer(
      {Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool mobile = checkMobile(size.width);
    return Container(
      width: size.width,
      height: size.height - (mobile ? mobileBarHeight : desktopBarHeight),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 100),
              alignment: Alignment.topLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  mobile
                      ? IconButton(
                          onPressed: () => Navigator.pushNamed(
                              context, const TakeCarePage().path),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: primaryColor,
                          ))
                      : Container(),
                  const Spacer(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: size.width * .7),
                    child: Container(
                      child: Text(
                        title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: fontSize * 1.3,
                            fontFamily: "Righteous"),
                      ),
                    ),
                  ),
                  const Spacer()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: content,
            )
          ],
        ),
      ),
    );
  }
}
