import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr_flutter_1/res/colors.dart';

typedef void OnClickFunction();

class ButtonWidget extends StatelessWidget {
  String _label = '';
  OnClickFunction _onClick = () => {};

  ButtonWidget(String label, OnClickFunction onClick) {
    this._label = label;
    this._onClick = onClick;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onClick,
      child: Text(
        _label,
        style: TextStyle(fontSize: 22),
      ),
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          primary: AppColors.mainColor,
          minimumSize: Size(230, 50)),
    );
  }
}
