import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/functions.dart';
import 'package:marlinazul_frontend/widgets/TextConstructor.dart';
import 'package:marlinazul_frontend/widgets/page_custom_view.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';

class SpoofingBlogPage extends PageImpl {
  const SpoofingBlogPage({Key? key})
      : super(
            key: key,
            title: "Spoofing",
            visible: false,
            assetPath: "images/xg-spoofing.jpg",
            subtitle: "Não seja enganado");

  @override
  State<PageImpl> createState() => _SpoofingBlogPageState();
}

class _SpoofingBlogPageState extends State<SpoofingBlogPage> {
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
          children: [
            TextConstructor.MainTitle(
                widget.title, primaryColor, const EdgeInsets.only(bottom: 15)),
            TextConstructor.Paragraph(const [
              TextSpan(
                  text:
                      "O spoofing é um tipo de ataque onde o criminoso finge ser "
                      "uma fonte conhecida, assim tendo acesso a informações privadas, "
                      "buscando ganho próprio com o ataque. "
                      "Para que o ataque funcione o atacante deve saber como usar de "
                      "engenharia social. Assim a vítima pode ser induzida a fornecer "
                      "informações pessoais sem desconfiar de que se trata de um golpe.")
            ], Colors.white, const EdgeInsets.only(bottom: 12)),
            TextConstructor.Paragraph(const [
              TextSpan(
                  text:
                      "Um exemplo comum desse golpe é quando a vítima recebe a "
                      "ligação de um desconhecido dizendo que um parente próximo "
                      "foi sequestrado, pedindo que seja pago o resgate. Muitas "
                      "pessoas ao ter a idéia de um parente em um estado como esse "
                      "acabam caindo no golpe e pagando a quantia pedida pelo atacante.\n"
                      "Geralmente esse tipo de ataque é mais direcionado aos idosos, "
                      "por conta da idéia de que eles não tem tanto conhecimento de "
                      "tecnologia.")
            ], Colors.white, const EdgeInsets.only(bottom: 12)),
            TextConstructor.Paragraph(const [
              TextSpan(
                  text:
                      "O spoofing pode ocorrer de várias formas, como chamadas, "
                      "e-mails, mensagens de textos, websites, e também por meios "
                      "mais técnicos, como DNS, ARP ou GPS.")
            ], Colors.white, const EdgeInsets.only(bottom: 20)),
            TextConstructor.Subtitle(
                const [TextSpan(text: "Spoofing em Websites")],
                primaryColor,
                const EdgeInsets.only(bottom: 8)),
            TextConstructor.Paragraph(const [
              TextSpan(
                  text:
                      "O spoofing em websites ocorre quando um atacante faz com que um site "
                      "malicioso pareça seguro, usando fontes, logos, e cores legítimas. "
                      "Assim tentando replicar um site confiável com a intenção de levar "
                      "os usuários a um site de phishing, por exemplo. Esse tipo de site "
                      "tem endereços parecidos com os originais, e parecem reais à primeira "
                      "vista. Mas geralmente são criados para coletar informações do usuário.")
            ], Colors.white, const EdgeInsets.only(bottom: 12)),
            TextConstructor.Subtitle(
                const [TextSpan(text: "Spoofing de e-mails")],
                primaryColor,
                const EdgeInsets.only(bottom: 8)),
            TextConstructor.Paragraph(const [
              TextSpan(
                  text:
                      "O spoofing de e-mail ocorre quando um atacante envia e-mails "
                      "com endereços de remetentes falsos, com a intenção de pedir "
                      "dinheiro, roubar informações, ou até infectar a máquina com "
                      "algum tipo de malware. Esses remetentes falsos são criados "
                      "para parecer com alguém conhecido da vítima, sendo um colega "
                      "ou até alguém da empresa. Esses endereços de e-mails "
                      "geralmente contém pequenas diferenças quando comparados com o "
                      "original, como por exemplo, letras alternadas, números, ou "
                      "caracteres especiais.")
            ], Colors.white, const EdgeInsets.only(bottom: 12)),
            TextConstructor.Subtitle(
                const [TextSpan(text: "Spoofing de mensagens de texto")],
                primaryColor,
                const EdgeInsets.only(bottom: 8)),
            TextConstructor.Paragraph(const [
              TextSpan(
                  text:
                      "O spoofing de mensagem de texto ocorre quando um atacante "
                      "envia uma mensagem de texto ou SMS usando o número de "
                      "telefone de outra pessoa. Os atacantes fazem isso ocultando "
                      "sua identidade por trás de um ID de remetente alfanumérico "
                      "e geralmente incluem links para downloads de malware ou "
                      "sites de phishing. Certifique-se de estar ciente das dicas "
                      "de segurança móvel se você acredita que os dados do seu "
                      "telefone estão sendo comprometidos.")
            ], Colors.white, const EdgeInsets.only(bottom: 100)),
          ],
        ),
      ),
    );
  }
}
