import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/functions.dart';
import 'package:marlinazul_frontend/pages/blog_pages/clickjacking_blog_page.dart';
import 'package:marlinazul_frontend/pages/blog_pages/more_to_come_page.dart';
import 'package:marlinazul_frontend/pages/blog_pages/phishing_blog_page.dart';
import 'package:marlinazul_frontend/pages/blog_pages/spoofing_blog_page.dart';
import 'package:marlinazul_frontend/widgets/custom_card.dart';
import 'package:marlinazul_frontend/widgets/page_custom_view.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';

const highlight = false;
const path = "/takecare";
const showInBar = true;
const title = "Cuide-se";

class TakeCarePage extends PageImpl {
  const TakeCarePage({Key? key})
      : super(key: key, path: path, visible: showInBar, title: title);

  @override
  State<PageImpl> createState() => _TakeCarePageState();
}

class _TakeCarePageState extends State<TakeCarePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => PageCustomView(
        view: view(context),
        path: widget.path,
        backButton: false,
      );

  Widget view(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool mobile = checkMobile(size.width);
    double cardWidth = mobile ? size.width * .9 : size.width * .4;
    double padding = mobile ? size.width * .03 : size.width * .05;
    return Container(
      height: size.height - (mobile ? mobileBarHeight : desktopBarHeight),
      alignment: Alignment.topCenter,
      width: size.width,
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(padding, 10, padding, 30),
          child: Column(
            children: [
              Wrap(
                direction: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomCard(
                      page: const PhishingBlogPage(),
                      width: cardWidth,
                      clickable: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomCard(
                      page: const ClickjackingBlogPage(),
                      width: cardWidth,
                      clickable: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomCard(
                      page: const SpoofingBlogPage(),
                      width: cardWidth,
                      clickable: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomCard(
                      page: const MoreToComePage(),
                      width: cardWidth,
                      clickable: false,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
