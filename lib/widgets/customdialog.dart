import 'package:flutter/material.dart';

const Color _primaryColorPurple = const Color(0xFF655EE9);
const Color _secondaryColorPink = const Color(0xFFA975E4);

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Color backgroundColor, titleColor, descriptionColor;
  final VoidCallback onPress;

  const CustomDialog(
      {Key key,
      this.title,
      this.description,
      this.buttonText,
      this.backgroundColor,
      this.descriptionColor,
      this.titleColor,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(15.0)),
            width: double.infinity,
            padding: EdgeInsets.only(top: 35.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: titleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Text(
                  description,
                  style: TextStyle(
                      color: descriptionColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0),
                ),
                SizedBox(
                  height: 45.0,
                ),
                Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0)),
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
                      onTap: onPress,
                      child: Center(
                        child: Text(
                          buttonText,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
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
    );
  }
}
