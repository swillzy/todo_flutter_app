import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_app/pages/createtask.dart';
import 'package:todo_app/pages/profile.dart';
import 'package:todo_app/widgets/customdialog.dart';
import 'package:todo_app/widgets/takscard.dart';

const Color _primaryColorPurple = const Color(0xFF655EE9);
const Color _secondaryColorPink = const Color(0xFFA975E4);
const Color _backgroundColorDarkGrey = const Color(0xFF1D1F24);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController = PageController(initialPage: 0);
  int _selectedPage = 0;
  ScrollController _homeScrollController = ScrollController();
  final GlobalKey<RefreshIndicatorState> _homeRefreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  bool publicProfile = true;
  bool loadingPublicProfile = false;
  bool sharedTasks = true;
  bool loadingSharedTasks = false;
  bool enableNotifications = true;
  bool loadingEnableNotifications = false;

  final String avatarURL =
      'https://avatars0.githubusercontent.com/u/46610810?s=460&u=27c1e5cf1c4f83db84d3ddfe79cae3f539df12a8&v=4';

  @override
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

  Future _load() async {
    _homeRefreshIndicatorKey.currentState?.show();
    return;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusAndNavigationBarColors(_backgroundColorDarkGrey);

    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (int) {},
          children: [
            Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 65,
                ),
                height: double.infinity,
                width: double.infinity,
                color: _backgroundColorDarkGrey,
                child: RefreshIndicator(
                  key: _homeRefreshIndicatorKey,
                  onRefresh: () {},
                  child: SingleChildScrollView(
                    controller: _homeScrollController,
                    physics: BouncingScrollPhysics(),
                    clipBehavior: Clip.none,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${(([
                            'Hello',
                            'Olá',
                            'こんにちは',
                            'Hallo',
                            'Bonjour',
                            'Здравствуйте'
                          ]..shuffle()).first)},",
                          style: TextStyle(color: Colors.grey, fontSize: 14.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Willian Santos!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                            ),
                            Hero(
                              tag: 'avatar',
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: Profile(
                                              avatarURL: avatarURL,
                                              fullName: 'Willian Santos',
                                              usermail: 'santoswillc@gmail.com',
                                            ),
                                            ctx: context));
                                  },
                                  child: ClipOval(
                                    child: FancyShimmerImage(
                                      width: 50.0,
                                      height: 50.0,
                                      imageUrl: avatarURL,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35.0,
                        ),
                        TaskCard(
                          heroTag: 't1',
                          taskColor: Colors.redAccent,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        TaskCard(
                          heroTag: 't2',
                          taskColor: Colors.blueAccent,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        TaskCard(
                          heroTag: 't3',
                          taskColor: Colors.greenAccent,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        TaskCard(
                          heroTag: 't4',
                          taskColor: Colors.yellowAccent,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        TaskCard(
                          heroTag: 't5',
                          taskColor: Colors.purpleAccent,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        TaskCard(
                          heroTag: 't6',
                          taskColor: Colors.amberAccent,
                        ),
                      ],
                    ),
                  ),
                )),
            Container(
              color: _backgroundColorDarkGrey,
              padding: EdgeInsets.only(top: 65.0, left: 25.0, right: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 26.0,
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Public profile',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      loadingPublicProfile
                          ? SizedBox(
                              width: 28.0,
                              height: 28.0,
                              child: CircularProgressIndicator(
                                backgroundColor: _primaryColorPurple,
                              ),
                            )
                          : FlutterSwitch(
                              value: publicProfile,
                              width: 50.0,
                              height: 28.0,
                              activeColor: _primaryColorPurple,
                              onToggle: (val) {
                                setState(() {
                                  publicProfile = val;
                                  loadingPublicProfile = true;
                                });
                              },
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Set your profile visible to other users. They can find you by searching for your full name, username or email address.',
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 65,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shared tasks',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      loadingSharedTasks
                          ? SizedBox(
                              width: 28.0,
                              height: 28.0,
                              child: CircularProgressIndicator(
                                backgroundColor: _primaryColorPurple,
                              ),
                            )
                          : FlutterSwitch(
                              value: sharedTasks,
                              width: 50.0,
                              height: 28.0,
                              activeColor: _primaryColorPurple,
                              onToggle: (val) {
                                setState(() {
                                  sharedTasks = val;
                                  loadingSharedTasks = true;
                                });
                              },
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Allows your friends to add you as a member of a task.',
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 65,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Notifications',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      loadingEnableNotifications
                          ? SizedBox(
                              width: 28.0,
                              height: 28.0,
                              child: CircularProgressIndicator(
                                backgroundColor: _primaryColorPurple,
                              ),
                            )
                          : FlutterSwitch(
                              value: enableNotifications,
                              width: 50.0,
                              height: 28.0,
                              activeColor: _primaryColorPurple,
                              onToggle: (val) {
                                setState(() {
                                  enableNotifications = val;
                                  loadingEnableNotifications = true;
                                });
                              },
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'You will receive a notification when a task is completed or when the deadline is approaching. This option can be disabled individually for each task.',
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomAppBar(
          color: _backgroundColorDarkGrey,
          elevation: 0.0,
          child: Container(
            padding: EdgeInsets.only(top: 15.0),
            height: 80,
            color: _backgroundColorDarkGrey,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 25.0,
                  padding: EdgeInsets.only(left: 70.0),
                  icon: _selectedPage == 0
                      ? Icon(
                          MfgLabs.home,
                          color: Colors.white,
                        )
                      : Icon(
                          MfgLabs.home,
                          color: Colors.grey,
                        ),
                  onPressed: () {
                    if (_selectedPage != 0) {
                      setState(() {
                        _pageController.animateToPage(0,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                        _selectedPage = 0;
                      });
                    } else {
                      if (_homeScrollController.offset != 0) {
                        _homeScrollController.animateTo(0,
                            duration: Duration(seconds: 1), curve: Curves.ease);
                      } else {
                        _load();
                      }
                    }
                  },
                ),
                IconButton(
                  iconSize: 60.0,
                  icon: Container(
                    width: 60.0,
                    height: 60.0,
                    foregroundDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [_primaryColorPurple, _secondaryColorPink]),
                        backgroundBlendMode: BlendMode.screen),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 25.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: CreateTask(),
                            ctx: context));
                  },
                ),
                IconButton(
                  iconSize: 25.0,
                  padding: EdgeInsets.only(right: 70.0),
                  icon: _selectedPage == 1
                      ? Icon(
                          MfgLabs.cog,
                          color: Colors.white,
                        )
                      : Icon(
                          MfgLabs.cog,
                          color: Colors.grey,
                        ),
                  onPressed: () {
                    setState(() {
                      _pageController.animateToPage(1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeOut);
                      _selectedPage = 1;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPopScope() async {
    if (_selectedPage == 0) {
      if (_homeScrollController.offset == 0) {
        showDialog(
            context: context,
            builder: (_) {
              return CustomDialog(
                title: 'Are you sure?',
                titleColor: Colors.white,
                description: 'You are about to close the app.',
                descriptionColor: Colors.grey,
                backgroundColor: _backgroundColorDarkGrey,
                buttonText: 'Confirm',
                onPress: () {
                  Navigator.of(context).pop(false);
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
              );
            });
        return false;
      } else {
        setState(() {
          _homeScrollController.animateTo(0,
              duration: Duration(seconds: 1), curve: Curves.ease);
        });
      }
    } else {
      setState(() {
        _pageController.animateToPage(0,
            duration: Duration(milliseconds: 400), curve: Curves.easeIn);
        _selectedPage = 0;
      });
    }
  }
}
