import 'package:flutter/material.dart';

class TakeCarePage extends StatefulWidget {
  const TakeCarePage({Key? key}) : super(key: key);

  @override
  _TakeCarePageState createState() => _TakeCarePageState();
}

class _TakeCarePageState extends State<TakeCarePage> {
  @override
  Widget build(BuildContext context) {
    bool mobile = MediaQuery.of(context).size.width <= 715;
    return view(mobile);
  }

  Widget view(bool mobile) {
    return Container();
  }
}
