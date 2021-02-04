import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/pages/login.dart';

const Color _primaryColorPurple = const Color(0xFF655EE9);
const Color _secondaryColorPink = const Color(0xFFA975E4);
const Color _backgroundColorDarkGrey = const Color(0xFF1D1F24);
const Color _cardColorLightGrey = const Color(0xFF252837);

class Profile extends StatefulWidget {
  final String avatarURL;
  final String fullName;
  final String usermail;
  const Profile({Key key, this.avatarURL, this.fullName, this.usermail})
      : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: _backgroundColorDarkGrey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 65.0, left: 25.0, right: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Hero(
                        tag: 'avatar',
                        child: ClipOval(
                          child: FancyShimmerImage(
                            width: 70.0,
                            height: 70.0,
                            imageUrl: widget.avatarURL,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        children: [
                          Text(
                            widget.fullName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                          Text(
                            widget.usermail,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.redAccent,
                    ),
                    iconSize: 25.0,
                    onPressed: () {
                      setLogout();
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: Login(),
                              ctx: context));
                    },
                  ),
                ],
              ),
            ),
            Divider(
              height: 65.0,
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }

  setLogout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogged', false);
  }
}
