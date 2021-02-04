import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_app/pages/taskdetails.dart';

const Color _cardColorLightGrey = const Color(0xFF252837);
const Color _primaryColorPurple = const Color(0xFF655EE9);

class TaskCard extends StatelessWidget {
  final Color taskColor;
  final String heroTag;

  TaskCard({Key key, this.taskColor, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      color: _cardColorLightGrey,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                  type: PageTransitionType.fade,
                  child: TaskDetails(
                    heroTag: heroTag,
                  ),
                  ctx: context));
        },
        highlightColor: _primaryColorPurple.withOpacity(.4),
        splashColor: _primaryColorPurple.withOpacity(.4),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Hero(
            tag: heroTag,
            child: Container(
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 35.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(left: BorderSide(width: 5.0, color: taskColor)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Talex global design',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      Text(
                        'Tomorrow',
                        style: TextStyle(
                            color: Colors.greenAccent, fontSize: 14.0),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            ClipOval(
                              child: FancyShimmerImage(
                                width: 35.0,
                                height: 35.0,
                                imageUrl:
                                    'https://cdn.dribbble.com/users/3499788/screenshots/14887854/media/9ef31acd516128c91a1b116535c9b923.png?compress=1&resize=800x600',
                              ),
                            ),
                            Container(
                              transform:
                                  Matrix4.translationValues(-15, 0.0, 0.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.0),
                                border: Border.all(
                                    color: _cardColorLightGrey, width: 2.0),
                                color: Colors.transparent,
                              ),
                              child: ClipOval(
                                child: FancyShimmerImage(
                                  width: 35.0,
                                  height: 35.0,
                                  imageUrl:
                                      'https://i.pinimg.com/originals/da/be/91/dabe91170bc6fc5b50f7c0e18af0043d.jpg',
                                ),
                              ),
                            ),
                            Container(
                              transform:
                                  Matrix4.translationValues(-30, 0.0, 0.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.0),
                                border: Border.all(
                                    color: _cardColorLightGrey, width: 2.0),
                                color: Colors.transparent,
                              ),
                              child: ClipOval(
                                child: FancyShimmerImage(
                                  width: 35.0,
                                  height: 35.0,
                                  imageUrl:
                                      'https://static.wikia.nocookie.net/darling-in-the-franxx/images/b/b3/Zero_Two_appearance.jpg/revision/latest/scale-to-width-down/340?cb=20180807204943',
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              transform:
                                  Matrix4.translationValues(-28, 0.0, 0.0),
                              child: Text(
                                '+8',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 13.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: 70.0,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                child: LinearProgressIndicator(
                                  backgroundColor: Colors.grey[800],
                                  value: .6,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              '6/10',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
