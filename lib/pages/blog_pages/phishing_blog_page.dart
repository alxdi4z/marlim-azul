import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/functions.dart';
import 'package:marlinazul_frontend/widgets/page_custom_view.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';

class PhishingBlogPage extends PageImpl {
  const PhishingBlogPage({Key? key})
      : super(
            key: key,
            title: "Phishing",
            visible: false,
            subtitle: "O que é phishing e como reconhecer esse tipo de ataque",
            assetPath: "images/phishing.jpg");

  @override
  State<PageImpl> createState() => _PhishingBlogPageState();
}

class _PhishingBlogPageState extends State<PhishingBlogPage> {
  @override
  Widget build(BuildContext context) =>
      PageCustomView(view: view(context), backButton: true);

  Widget view(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool mobile = checkMobile(size.width);
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      width: mobile ? size.width * .9 : size.width * .7,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Center(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize * 1.7),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: RichText(
                    textAlign: TextAlign.justify,
                    text: const TextSpan(
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize,
                            height: 1.5),
                        children: [
                          TextSpan(
                              text:
                                  "Phishing é um tipo de ataque que usa de engenharia social "
                                  "para enganar as vítimas. Com um significado parecido "
                                  "com a palavra fishing (pescar em inglês), esse ataque usa de "
                                  "formulários, e-mails falsos, mensagens de texto, e até "
                                  "telefonemas para “pescar” credenciais e dados "
                                  "sensíveis da vítima.")
                        ]))),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                      style: TextStyle(
                          color: Colors.white, fontSize: fontSize, height: 1.5),
                      children: [
                        TextSpan(
                            text:
                                "O phishing é bem comum, já que acaba sendo um ataque bem efetivo. "
                                "O melhor jeito de se proteger de um phishing é sabendo como "),
                        TextSpan(
                            text: "identificá-lo.",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ])),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 3.5,
                      backgroundColor: primaryColor,
                    ),
                    RichText(
                        textAlign: TextAlign.justify,
                        text: const TextSpan(
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: fontSize * 1.2,
                                height: 1.5),
                            children: [
                              TextSpan(text: " Ações urgentes ou ameaças")
                            ]))
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: RichText(
                    textAlign: TextAlign.justify,
                    text: const TextSpan(
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize,
                            height: 1.5),
                        children: [
                          TextSpan(
                              text:
                                  "Geralmente os ataques são compostos de mensagens que passam urgência, pedindo para que você "
                                  "clique, ligue para um número, ou abra um anexo imediatamente. Muitas vezes essas "
                                  "mensagens virão com um texto dizendo que você deve executar uma ação "
                                  "para ganhar uma recompensa ou evitar algum tipo de penalidade. Criar "
                                  "um senso de urgência é bem comum quando se trata de ataques de "
                                  "phishing. Isso é feito para que você não pense antes de fazer o que é "
                                  "requisitado na mensagem.")
                        ]))),
            Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 3.5,
                      backgroundColor: primaryColor,
                    ),
                    RichText(
                        textAlign: TextAlign.justify,
                        text: const TextSpan(
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: fontSize * 1.2,
                                height: 1.5),
                            children: [
                              TextSpan(text: " Remetentes desconhecidos")
                            ]))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
