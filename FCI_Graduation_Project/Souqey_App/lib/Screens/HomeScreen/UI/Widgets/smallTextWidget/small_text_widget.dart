import 'package:flutter/material.dart';
import 'package:souqey/Screens/HomeScreen/Constants/HomeConsts.dart';

class SmallTextWidget extends StatefulWidget {
  const SmallTextWidget({super.key});

  @override
  _SmallTextWidgetState createState() => _SmallTextWidgetState();
}

class _SmallTextWidgetState extends State<SmallTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      HomeConsts.categorySmallText,
      style: HomeConsts.style1(context),
      textAlign: TextAlign.start,
      softWrap: true,
    );
  }
}
