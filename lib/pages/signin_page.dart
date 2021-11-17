import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/functions.dart';
import 'package:marlinazul_frontend/widgets/custom_alert.dart';
import 'package:marlinazul_frontend/widgets/page_custom_view.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';
import 'package:marlinazul_frontend/widgets/email_text_field.dart';
import 'package:marlinazul_frontend/widgets/row_box.dart';

const title = "Inscreva-se";
const path = "/signin";
const showInBar = true;
const highlight = true;

class SignInPage extends PageImpl {
  final Map<String, String> queryParameters;

  const SignInPage({Key? key, required this.queryParameters})
      : super(key: key, path: path, visible: showInBar, title: title);

  @override
  State<PageImpl> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late bool sent;

  @override
  void initState() {
    sent = false;
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PageCustomView(
        view: view(context),
        path: widget.path,
        backButton: false,
      );

  Widget view(BuildContext context) {
    if (!sent) {
      if (widget.queryParameters.containsKey("message")) {
        if (widget.queryParameters["message"] == "true") {
          saveAccess(true, false);
          setState(() {
            sent = true;
          });
        }
      }
    }

    Size size = MediaQuery.of(context).size;
    bool mobile = checkMobile(size.width);
    double height = size.height - (mobile ? mobileBarHeight : desktopBarHeight);
    return Container(
        alignment: Alignment.center,
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
                                    TextSpan(text: "Se inscreva "),
                                    TextSpan(
                                        text: "agora mesmo ",
                                        style: TextStyle(color: primaryColor)),
                                    TextSpan(text: "na nossa "),
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
                                  sendEmail(
                                      textController.text,
                                      mobile
                                          ? size.width * .8
                                          : size.width * .2);
                                  textController.text = "";
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

  Future sendEmail(String clientEmail, double width) async {
    const String url =
        "https://marlim-email-sender.herokuapp.com/api/v1/sendemail";
    Map<String, dynamic> body = {
      "subject": "Presente de Black Friday",
      "to": clientEmail,
      "text": "",
      "offer": true
    };
    try {
      Response res = await post(Uri.parse(url),
          headers: {
            "accept": "application/json",
            "Content-Type": "application/json; charset=utf-8",
            "Access-Control_Allow_Origin": "*"
          },
          body: json.encode(body));
      if (res.body.toString().toLowerCase() == "success") {
        showDialog(
            context: context,
            builder: (context) => CustomAlert(
                width: width,
                title: "Sucesso",
                message: "Obrigado por se cadastrar!",
                success: true));
      } else {
        showDialog(
            context: context,
            builder: (context) => CustomAlert(
                width: width,
                title: "Ops...",
                message: "Não foi possível cadastrar o e-mail.",
                success: false));
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => CustomAlert(
              width: width,
              title: "Ops...",
              message: "Não foi possível cadastrar o e-mail.",
              success: false));
    }
  }
}
