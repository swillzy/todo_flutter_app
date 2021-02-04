import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/pages/home.dart';

const Color _primaryColorPurple = const Color(0xFF655EE9);
const Color _secondaryColorPink = const Color(0xFFA975E4);
const Color _backgroundColorDarkGrey = const Color(0xFF1D1F24);
const Color _cardColorLightGrey = const Color(0xFF252837);

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<Object> accounts = [
    {
      'name': 'Willian Santos',
      'email': 'santoswillc@gmail.com',
      'avatar':
          'https://scontent.fcfc2-1.fna.fbcdn.net/v/t1.0-9/106699598_3214633918762375_6951948029448023247_o.jpg?_nc_cat=107&ccb=2&_nc_sid=09cbfe&_nc_ohc=fQ2z2X7ehDcAX-YBpb0&_nc_ht=scontent.fcfc2-1.fna&oh=9353098f5c7a03884a055a7ec80fd908&oe=60270921'
    },
    {
      'name': 'Sebastião Santos',
      'email': 'willbrgameplay@gmail.com',
      'avatar':
          'https://scontent.fcfc2-1.fna.fbcdn.net/v/t1.0-9/100603348_106621844401117_8910184258581037056_o.jpg?_nc_cat=107&ccb=2&_nc_sid=09cbfe&_nc_ohc=RRb9CW3U6GwAX_Gfjc-&_nc_ht=scontent.fcfc2-1.fna&oh=90c928b46d77bb8257f362b973834ce7&oe=60299D06'
    }
  ];

  String _selectedAccount;

  void initState() {
    super.initState();

    changeStatusAndNavigationBarColors(_backgroundColorDarkGrey);
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
    return Scaffold(
      body: Container(
        color: _backgroundColorDarkGrey,
        padding: EdgeInsets.only(top: 65.0, left: 25.0, right: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  DropdownButton(
                    hint: Text('Select an account'),
                    value: _selectedAccount,
                    onChanged: (value) {
                      setState(() {
                        _selectedAccount = value;
                      });
                    },
                    items: [],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  ),
                ],
              ),
            ),
            Container(
              child: IconButton(
                icon: Icon(Icons.navigate_next),
                onPressed: () {
                  setLogged();
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: Home(),
                          ctx: context));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  setLogged() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogged', true);
  }
}
