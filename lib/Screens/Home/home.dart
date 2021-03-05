import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_miles/Services/auth.dart';
import 'package:sky_miles/Services/database.dart';
import 'rewards_list.dart';
import 'package:sky_miles/Models/MyUser.dart';
import '../../Models/reward.dart';
import 'addRewardForm.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  // @override
  // void initState() {
  //   // DatabaseService.getUdata();
  // }

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

    return StreamProvider<List<Reward>>.value(
      value: DatabaseService(uid: uid).userRewardsStream,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sky Miles'),
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.logout, color: Colors.white),
              // label: Text('Logout', style: TextStyle(color: Colors.white),),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: RewardsList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          // label: Text('New Reward'), 
          onPressed: () => _showAddRewardPanel(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_rounded),
              label: 'Rewards',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.redeem_rounded),
              label: 'Redeemed',
              backgroundColor: Colors.blue,
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}