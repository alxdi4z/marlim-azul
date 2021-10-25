import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/widgets/email_text_field.dart';
import 'package:marlinazul_frontend/widgets/row_box.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  final textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool mobile = size.width <= 800;
    return view(mobile, size, context);
  }

  Widget view(bool mobile, Size size, BuildContext context) {
    double height = size.height - (mobile ? mobileBarHeight : desktopBarHeight);
    return SizedBox(
        height: height,
        width: size.width,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RowBox(
                  widgets: [
                    SizedBox(
                      width: mobile ? size.width * .9 : size.width * .5,
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Righteous",
                                          fontSize: fontSize * 1.6,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(text: "Junte-se a "),
                                        TextSpan(
                                            text: "nós",
                                            style:
                                                TextStyle(color: primaryColor)),
                                        TextSpan(text: "!")
                                      ]))),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: RichText(
                                  text: const TextSpan(
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Righteous",
                                          fontSize: fontSize),
                                      children: [
                                    TextSpan(
                                        text:
                                            "O Marlim se preocupa com sua segurança, "
                                            "por isso queremos que você esteja sempre "
                                            "atualizado sobre como se prevenir às novas formas de ataque "
                                            "que surgem por aí.\n"),
                                    TextSpan(
                                        text:
                                            "Se inscreva agora mesmo na nossa "),
                                    TextSpan(
                                        text: "newsletter ",
                                        style: TextStyle(color: primaryColor)),
                                    TextSpan(
                                        text:
                                            "para ter a chance de ganhar um "),
                                    TextSpan(
                                        text: "brinde incrível!",
                                        style: TextStyle(color: primaryColor))
                                  ]))),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 23),
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: "Righteous",
                                          fontSize: fontSize * 1.3),
                                      children: [
                                        TextSpan(
                                            text: "Se inscreva agora mesmo!"),
                                      ]))),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Container(
                              width: mobile ? size.width * .7 : size.width * .4,
                              child: EmailTextField(
                                controller: textController,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: mobile ? size.width * .7 : size.width * .4,
                            child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith((states) =>
                                          primaryColor.withOpacity(0.3)),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Inscrever email ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              onPressed: () {
                                final form = _formKey.currentState!;
                                if (form.validate()) {
                                  print("done");
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: mobile ? 35 : 10, bottom: 10),
                      child: SvgPicture.asset("images/gift.svg",
                          placeholderBuilder: (context) => SizedBox(
                                child: CircularProgressIndicator(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                height:
                                    mobile ? size.width * .4 : size.width * .2,
                                width:
                                    mobile ? size.width * .4 : size.width * .2,
                              ),
                          width: mobile ? size.width * .7 : size.width * .3),
                    ),
                  ],
                  width: size.width * .9,
                  background: false,
                )
              ],
            ),
          ),
        ));
  }

  Future sendEmail(String client_email, String subject, String html) async {}
}
