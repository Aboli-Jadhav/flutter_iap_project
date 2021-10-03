import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'busy_model.dart';
import 'package:flutter_iap_project/Authentication/locator.dart';
import 'package:flutter_iap_project/Authentication/services/authentication_service.dart';
import 'package:flutter_iap_project/Authentication/services/navigator_service.dart';

class SignUpViewModel extends BaseModel {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future signUp({required String email, required String password}) async {
    setBusy(true);

    var result = await _authenticationService.signUpWithEmail(
        email: email, password: password);

    setBusy(false);
    if (result is bool) {
      if (result) {
        //_navigationService.navigateTo(HomeViewRoute);
      } else {
        await _scaffoldKey.currentState!.showSnackBar(SnackBar(
          content: Text("Sign Up Failure Please Try Later !"),
        ));
      }
    } else {
      await _scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text("Sign Up Error !"),
      ));
    }
  }
}