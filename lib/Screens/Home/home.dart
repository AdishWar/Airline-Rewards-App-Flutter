import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_miles/Models/redeem.dart';
import 'package:sky_miles/Services/auth.dart';
import 'package:sky_miles/Services/database.dart';
import 'rewards_list.dart';
import 'package:sky_miles/Models/MyUser.dart';
import '../../Models/reward.dart';
import 'addRewardForm.dart';
import 'redeems_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  int _currentIndex = 0;
  final tabs = [
    RewardsList(),
    RedeemsList()
  ];

  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<MyUser>(context).userid;

    void _showAddRewardPanel() {
      showModalBottomSheet(
        context: context, 
        builder: (context) {
          return Container (
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: AddRewardForm(),
          );
        }
      );
    }

    return StreamProvider<List<Redeem>>.value(
      value: DatabaseService(uid: uid).userRedeemedStream,
      child: StreamProvider<List<Reward>>.value(
        value: DatabaseService(uid: uid).userRewardsStream,
        child: Scaffold(


          appBar: AppBar(
            title: Text('Sky Miles'),
            actions: [
              FlatButton.icon(
                icon: Icon(Icons.logout, color: Colors.white),
                label: Text('Logout', style: TextStyle(color: Colors.white),),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ],
          ),


          body: tabs[_currentIndex],


          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            // label: Text('New Reward'), 
            onPressed: () => _showAddRewardPanel(),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


          bottomNavigationBar: BottomNavigationBar(
            // type: BottomNavigationBarType.shifting,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet_rounded),
                label: 'Rewards',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.redeem_rounded),
                label: 'Redeemed',
                // backgroundColor: Colors.orange,
              ),
            ],
            onTap: (index) {
              setState(() { _currentIndex = index; });
              print(index);
            },
          ),

        ),
      ),
    );
  }
}

// To make it look like 0:19, try this:


// bottomNavigationBar: BottomAppBar(
//         notchMargin: 5,
//         shape: CircularNotchedRectangle(),
//         color: Colors.white,
//         child: BottomNavigationBar(
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.cloud),
//               title: Text("Logs"),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.book),
//               title: Text("Education"),
//             ),
//           ],
//         ),
//       ),