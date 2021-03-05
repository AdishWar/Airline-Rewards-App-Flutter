import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:sky_miles/Models/MyUser.dart';
import 'package:sky_miles/Screens/wrapper.dart';
import 'package:sky_miles/Services/auth.dart';
// import 'package:sky_miles/Screens/Authentication/Welcome/welcome_screen.dart';

// email: ad2@gm.com, pass: 1234567

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Flutter Auth',
        // theme: ThemeData(
        //   primaryColor: kPrimaryColor,
        //   scaffoldBackgroundColor: Colors.white,
        // ),
        // home: WelcomeScreen(),
        home: Wrapper()
      ),
    );
  }
}
