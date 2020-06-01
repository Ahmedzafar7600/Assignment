import 'package:assignment/models/ResponseModel.dart';
import 'package:assignment/utils/HexColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class MyConstants{
  static final red_color = HexToColor("#e3422e");
  static ProgressDialog pr;
  static ResponseModel responseModel;

  static showLoadingBar(BuildContext context) {
    if (pr == null) {
      pr = new ProgressDialog(context);
      pr.style(message: "Loading...".toUpperCase(),
        progressWidget: CupertinoActivityIndicator(
          radius: 25,
        ),
      );
    }
    if (!pr.isShowing()) {
      pr.show();
    }
  }

  static hideLoadingBar() {
    if (pr != null && pr.isShowing()) {
      pr.hide();
    }
  }

}