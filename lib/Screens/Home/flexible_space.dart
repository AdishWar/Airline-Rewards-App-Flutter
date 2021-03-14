import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Models/redeem.dart';
import '../../Models/reward.dart';

class FlexibleSpace extends StatelessWidget {

  final int points;
  FlexibleSpace({ this.points });

  @override
  Widget build(BuildContext context) {

    final userRewards = Provider.of<List<Reward>>(context) ?? [];
    final userRedeems = Provider.of<List<Redeem>>(context) ?? [];

    int totalRewards = 0;
    int totalRedeems = 0;
    int totalRemainingPoints = 0;

    for(var i = 0; i < userRewards.length; i++) {
      totalRewards = totalRewards + userRewards[i].rewardPoints;
    }

    for(var i = 0; i < userRedeems.length; i++) {
      totalRedeems = totalRedeems + userRedeems[i].redeemedAmount;
    }

    totalRemainingPoints = totalRewards - totalRedeems;

    return Container(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
      height: 100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Balance',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '₹'+totalRemainingPoints.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 70,
              ),
            ),
          ],
        )
      ),
    );
  }
}