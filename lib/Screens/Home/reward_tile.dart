import 'package:flutter/material.dart';
import '../../Models/reward.dart';

class RewardTile extends StatelessWidget {

  final Reward reward;
  RewardTile({ this.reward });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: Card(
        elevation: 1,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            // backgroundColor: Colors.red,
            backgroundImage: AssetImage('assets/images/airplane.png')
          ),
          title: Row(
            children: [
              // Icon(Icons.check_circle_outline_rounded),
              Text( '₹' + reward.rewardPoints.toString(), style: TextStyle(fontSize: 20.0),)
            ],
          ),
          subtitle: Text('PNR #' + reward.pnr),
        )
      ),
    );
  }
}