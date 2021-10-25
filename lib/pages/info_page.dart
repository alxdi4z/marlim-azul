import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    bool mobile = MediaQuery.of(context).size.width <= 715;
    return view(mobile);
  }

  Widget view(bool mobile) {
    return Center(
      child: Container(
        color: Colors.green,
        height: 500,
        width: 500,
      ),
    );
  }
}
