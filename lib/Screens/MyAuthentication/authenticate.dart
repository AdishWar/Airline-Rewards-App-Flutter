import 'package:flutter/material.dart';
import 'package:sky_miles/Screens/MyAuthentication/register.dart';
import 'package:sky_miles/Screens/MyAuthentication/sign_in.dart';
import 'package:sky_miles/Services/auth.dart';


class Authenticate extends StatefulWidget {
  @override
  AuthenticateState createState() => AuthenticateState();
}

class AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn( toggleView: toggleView );
    } else {
      return Register(toggleView: toggleView);
    }
    
  }
}