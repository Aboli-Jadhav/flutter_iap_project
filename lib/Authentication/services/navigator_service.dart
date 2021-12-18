import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  void pop() {
    return _navigationKey.currentState!.pop();
  }

  Future<dynamic> navigateTo(int r, {dynamic arguments}) {
    if(r==2)
      return _navigationKey.currentState!.pushNamed('/adminpage', arguments: arguments);
    else if(r==1)
      return _navigationKey.currentState!.pushNamed('/master_adminHome', arguments: arguments);
    else
      return _navigationKey.currentState!.pushNamed('/viewerhome', arguments: arguments);

  }
}