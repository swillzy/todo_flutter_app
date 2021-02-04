import 'package:flutter/material.dart';
import 'package:todo_app/widgets/customdialog.dart';

const Color _primaryColorPurple = const Color(0xFF655EE9);
const Color _secondaryColorPink = const Color(0xFFA975E4);
const Color _backgroundColorDarkGrey = const Color(0xFF1D1F24);
const Color _cardColorLightGrey = const Color(0xFF252837);

class CreateTask extends StatefulWidget {
  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(top: 65.0, left: 25.0, right: 25.0),
          color: _backgroundColorDarkGrey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    iconSize: 35.0,
                    onPressed: () {
                      if (hasFieldsChanges()) {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return CustomDialog(
                                title: 'Are you sure?',
                                titleColor: Colors.white,
                                description: 'Your task will be lost.',
                                descriptionColor: Colors.grey,
                                backgroundColor: _backgroundColorDarkGrey,
                                buttonText: 'Confirm',
                                onPress: () {
                                  Navigator.of(context).pop(true);
                                  Navigator.of(context).pop(true);
                                },
                              );
                            });
                      } else {
                        Navigator.of(context).pop(true);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  hasFieldsChanges() {
    return false;
  }

  Future<bool> _onWillPop() {
    if (hasFieldsChanges()) {
      showDialog(
          context: context,
          builder: (_) {
            return CustomDialog(
              title: 'Are you sure?',
              titleColor: Colors.white,
              description: 'Your task will be lost.',
              descriptionColor: Colors.grey,
              backgroundColor: _backgroundColorDarkGrey,
              buttonText: 'Confirm',
              onPress: () {
                Navigator.of(context).pop(true);
                Navigator.of(context).pop(true);
              },
            );
          });
    } else {
      Navigator.of(context).pop(true);
    }
  }
}
