import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/functions.dart';
import 'package:marlinazul_frontend/widgets/TextConstructor.dart';
import 'package:marlinazul_frontend/widgets/page_custom_view.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';

class ClickjackingBlogPage extends PageImpl {
  const ClickjackingBlogPage({Key? key})
      : super(
            key: key,
            title: "Clickjacking",
            visible: false,
            subtitle: "O que um click pode fazer com você",
            assetPath: "images/clickjacking.jpg");

  @override
  State<PageImpl> createState() => _ClickjackingBlogPageState();
}

class _ClickjackingBlogPageState extends State<ClickjackingBlogPage> {
  @override
  Widget build(BuildContext context) =>
      PageCustomView(view: view(context), backButton: true);

  Widget view(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool mobile = checkMobile(size.width);
    double padding = mobile ? size.width * .05 : size.width * .15;
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Padding(
        padding: EdgeInsets.fromLTRB(padding, 15, padding, 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextConstructor.MainTitle(
                widget.title, primaryColor, const EdgeInsets.only(bottom: 15)),
            TextConstructor.Paragraph(const [
              TextSpan(
                  text:
                      "O clickjacking ocorre quando um atacante usa de várias camadas "
                      "transparentes para enganar um usuário e faze-lo clicar em um botão "
                      "ou link em outra camada quando na verdade o usuário pretendia clicar "
                      "em uma camada superior. Como o nome já diz, o atacante está "
                      "\"sequestrando\" os cliques dos usuários.")
            ], Colors.white, const EdgeInsets.only(bottom: 30)),
            TextConstructor.Paragraph(const [
              TextSpan(
                  text:
                      "Imagine por exemplo entrar em uma página com um botão de "
                      "título \"Clique aqui para ganhar um prêmio\". Mas em uma camada "
                      "superior à camada do botão o atacante coloca um iframe, com "
                      "um botão alinhado ao botão do prêmio que tem como ação "
                      "deletar sua conta na aplicação. A vítima tenta clicar no "
                      "botão para receber seu prêmio mas tem sua conta deletada "
                      "no mesmo instante, isso seria um sequestro de click.")
            ], Colors.white, const EdgeInsets.only(bottom: 8)),
            TextConstructor.Paragraph(const [
              TextSpan(
                  text:
                      "Muitas empresas grandes já sofreram com esse tipo de ataque, "
                      "e tem se tornado bem comum ultimamente.")
            ], Colors.white, const EdgeInsets.only(bottom: 12)),
            TextConstructor.Subtitle(
                const [TextSpan(text: "Pense antes de clicar")],
                primaryColor,
                const EdgeInsets.only(bottom: 8)),
            TextConstructor.Paragraph(const [
              TextSpan(
                  text: "Lembre-se sempre de passar o mouse sobre o botão ou "
                      "link antes de clicar em algo e verificar se a URL é a esperada.")
            ], Colors.white, const EdgeInsets.only(bottom: 10))
          ],
        ),
      ),
    );
  }
}
