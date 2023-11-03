
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Show Invalid Location Toast
void showToast() {
  Fluttertoast.showToast(
    msg: "No matching location found",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}