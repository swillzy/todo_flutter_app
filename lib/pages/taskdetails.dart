import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

const Color _primaryColorPurple = const Color(0xFF655EE9);
const Color _secondaryColorPink = const Color(0xFFA975E4);
const Color _backgroundColorDarkGrey = const Color(0xFF1D1F24);
const Color _cardColorLightGrey = const Color(0xFF252837);

class TaskDetails extends StatefulWidget {
  final String heroTag;

  TaskDetails({Key key, this.heroTag}) : super(key: key);

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  void initState() {
    super.initState();

    changeStatusAndNavigationBarColors(_cardColorLightGrey);
  }

  changeStatusAndNavigationBarColors(Color color) async {
    try {
      await FlutterStatusbarcolor.setStatusBarColor(color);
      await FlutterStatusbarcolor.setNavigationBarColor(color);

      if (useWhiteForeground(color)) {
        FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
        FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
      } else {
        FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
        FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        changeStatusAndNavigationBarColors(_backgroundColorDarkGrey);
        return true;
      },
      child: Hero(
        tag: widget.heroTag,
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: _cardColorLightGrey),
      ),
    );
  }
}
