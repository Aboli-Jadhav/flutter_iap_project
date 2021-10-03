import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Authentication/locator.dart';
import 'package:flutter_iap_project/Authentication/services/authentication_service.dart';
import 'package:flutter_iap_project/Authentication/services/navigator_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_iap_project/Authentication/view_model/busy_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginViewModel extends BaseModel {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future login({
    required int r,
    required String email,
    required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.loginWithEmail(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {

        _navigationService.navigateTo(r);

      } else {
        Fluttertoast.showToast(
            msg: "Login Failure",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1
        );

      }
    } else {
      Fluttertoast.showToast(
          msg: "Wrong Credentials Please Try Again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1
      );
    }
  }
}