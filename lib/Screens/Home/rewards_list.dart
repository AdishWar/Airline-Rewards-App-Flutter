import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Models/reward.dart';
import 'reward_tile.dart';

class RewardsList extends StatefulWidget {
  @override
  _RewardsListState createState() => _RewardsListState();
}

class _RewardsListState extends State<RewardsList> {
  @override
  Widget build(BuildContext context) {

    final userRewards = Provider.of<List<Reward>>(context) ?? [];

    // userRewards.forEach((reward) {
    //   print(reward.pnr);
    //   print(reward.rewardPoints);
    // });

    return ListView.builder(
      itemCount: userRewards.length,
      itemBuilder: (context, index) {
        return RewardTile(reward: userRewards[index]);
      },
    );
  }
}