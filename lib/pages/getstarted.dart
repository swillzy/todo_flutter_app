import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/pages/home.dart';
import 'package:todo_app/pages/login.dart';

const Color _backgroundColorDarkGrey = const Color(0xFF1D1F24);
const Color _primaryColorPurple = const Color(0xFF655EE9);
const Color _secondaryColorPink = const Color(0xFFA975E4);

class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  void initState() {
    super.initState();
    checkLogin();
    changeStatusAndNavigationBarColors();
  }

  Future<Null> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLogged = prefs.getBool('isLogged') ?? false;

    if (isLogged) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  changeStatusAndNavigationBarColors() async {
    try {
      await FlutterStatusbarcolor.setStatusBarColor(_primaryColorPurple);
      await FlutterStatusbarcolor.setNavigationBarColor(
          _backgroundColorDarkGrey);

      if (useWhiteForeground(_backgroundColorDarkGrey)) {
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
    String defaultLocale = Platform.localeName;
    debugPrint(defaultLocale);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: _backgroundColorDarkGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: (MediaQuery.of(context).size.height / 2),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(60)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [_primaryColorPurple, _secondaryColorPink])),
              child: Center(
                child: Image.asset(
                  'lib/assets/splash.png',
                  width: (MediaQuery.of(context).size.height / 2.5),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 50, right: 50, bottom: 80),
              child: Column(
                children: [
                  SizedBox(
                    height: 70.0,
                  ),
                  Text(
                    'Any Task, any goal.\nGet things done',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'For every minute spent organizing an hour is earned.',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [_primaryColorPurple, _secondaryColorPink]),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Center(
                          child: Text(
                            'Get started',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
