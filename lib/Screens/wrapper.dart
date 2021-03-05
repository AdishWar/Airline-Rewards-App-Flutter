import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sky_miles/Models/MyUser.dart';
import 'package:sky_miles/Screens/MyAuthentication/authenticate.dart';
import 'package:sky_miles/Screens/MyAuthentication/register.dart';
import 'package:sky_miles/Screens/MyAuthentication/sign_in.dart';
import 'Home/home.dart';
import 'Authentication/Welcome/welcome_screen.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser>(context);
    
    // return either home or auth widget
    if (user == null) {
      // return WelcomeScreen();
      // return SignIn();
      // return Register();
      return Authenticate();
    }
    else {
      return Home();
    }

    // return Home();

  }
}