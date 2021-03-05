import 'package:firebase_auth/firebase_auth.dart';
import 'package:sky_miles/Models/MyUser.dart';
import 'package:sky_miles/Services/database.dart';

class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser _userFromFirebaseUser(User user) {
    return (user != null) ? MyUser(userid: user.uid) : null;
  }

  // auth change user stream
  Stream<MyUser> get user {
    return _auth.authStateChanges().map((User user) => _userFromFirebaseUser(user));
  }

  // get UID
  Future<String> getCurrentUID() async {
    return (await _auth.currentUser).uid;
  }

  // signin anon
  Future signinAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      MyUser myUser = _userFromFirebaseUser(user);
    } catch(e) {
      
    }
  }
  
  // signin
  Future signinWithEmailPassword(String email, String password) async {
    try {
      UserCredential result =  await _auth.signInWithEmailAndPassword(email: email, password: password);
      User firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch(e) {
      print(e.toString() );
    }
  }


  // register
  Future registerWithEmailPassword(String email, String password) async {
    try {
      UserCredential result =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User firebaseUser = result.user;

      // await DatabaseService(uid: firebaseUser.uid).updateUserData([], []);
      // DatabaseService(uid: firebaseUser.uid).

      return _userFromFirebaseUser(firebaseUser);
    } catch(e) {
      print(e.toString() );
    }
  }

  // signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
    }
  }


}