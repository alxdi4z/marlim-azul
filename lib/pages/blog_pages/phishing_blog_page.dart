import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/functions.dart';
import 'package:marlinazul_frontend/widgets/TextConstructor.dart';
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
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextConstructor.MainTitle(
                widget.title, primaryColor, const EdgeInsets.only(bottom: 15)),
            TextConstructor.Paragraph(const [
              TextSpan(
                  text:
                      "Phishing é um tipo de ataque que usa de engenharia social "
                      "para enganar as vítimas. Com um significado parecido "
                      "com a palavra fishing (pescar em inglês), esse ataque usa de "
                      "formulários, e-mails falsos, mensagens de texto, e até "
                      "telefonemas para “pescar” credenciais e dados "
                      "sensíveis da vítima."),
            ], Colors.white, const EdgeInsets.only(bottom: 8)),
            TextConstructor.Paragraph(const [
              TextSpan(
                  text:
                      "O phishing é bem comum, já que acaba sendo um ataque bem efetivo. "
                      "O melhor jeito de se proteger de um phishing é sabendo como "),
              TextSpan(
                  text: "identificá-lo.",
                  style: TextStyle(fontWeight: FontWeight.bold))
            ], Colors.white, const EdgeInsets.only(bottom: 30)),
            TextConstructor.Subtitle(
                const [TextSpan(text: "Ações urgentes ou ameaças")],
                primaryColor,
                const EdgeInsets.only(bottom: 8)),
            TextConstructor.Paragraph(const [
              TextSpan(
                  text:
                      "Geralmente os ataques são compostos de mensagens que passam urgência, pedindo para que você "
                      "clique, ligue para um número, ou abra um anexo imediatamente. Muitas vezes essas "
                      "mensagens virão com um texto dizendo que você deve executar uma ação "
                      "para ganhar uma recompensa ou evitar algum tipo de penalidade. Criar "
                      "um senso de urgência é bem comum quando se trata de ataques de "
                      "phishing. Isso é feito para que você não pense antes de fazer o que é "
                      "requisitado na mensagem.")
            ], Colors.white, const EdgeInsets.only(bottom: 12)),
            TextConstructor.Subtitle(
                const [TextSpan(text: "Remetentes desconhecidos")],
                primaryColor,
                const EdgeInsets.only(bottom: 8)),
            TextConstructor.Paragraph(const [
              TextSpan(
                  text:
                      "Pode não ser fora do comum receber um e-mail de um remetente desconhecido, "
                      "mesmo se o remetente não fazer parte da sua organização, "
                      "mas isso pode ser um sinal de phishing. "
                      "Sempre tire um tempo para analizar mensagens "
                      "de remetentes desconhecidos antes de interagir com o conteúdo.")
            ], Colors.white, const EdgeInsets.only(bottom: 12)),
            TextConstructor.Subtitle(const [TextSpan(text: "Gramática ruim")],
                primaryColor, const EdgeInsets.only(bottom: 8)),
            TextConstructor.Paragraph(const [
              TextSpan(
                  text:
                      "Empresas ou organizações geralmente tem funcionários responsáveis "
                      "por verificar os conteúdos que serão compartilhados para entregar "
                      "algo de alta qualidade. Se acaso a mensagem ou e-mail vier com erros "
                      "ortográficos ou gramaticais óbvios, pode se tratar de uma tentativa "
                      "de phishing. Geralmente esses erros ocorrem por traduções inadequadas "
                      "de um idioma estrangeiro ou tentativas de escapar de algum filtro "
                      "que bloqueia esse tipo de ataque.")
            ], Colors.white, const EdgeInsets.only(bottom: 12)),
            TextConstructor.Subtitle(
                const [TextSpan(text: "Links ou anexos suspeitos")],
                primaryColor,
                const EdgeInsets.only(bottom: 8)),
            TextConstructor.Paragraph(const [
              TextSpan(
                  text:
                      "Quando receber e-mails que possuem links ou anexos, não deixe "
                      "de verificar sua veracidade antes de fazer algo. Passe o mouse "
                      "sobre os links e analise a url antes de clicar, abra um link "
                      "somente se a URL mostrada for confiável.")
            ], Colors.white, const EdgeInsets.only(bottom: 100))
          ],
        ),
      ),
    );
  }
}
