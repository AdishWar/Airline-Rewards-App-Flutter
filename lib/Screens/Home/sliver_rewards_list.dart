import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Models/reward.dart';
import 'reward_tile.dart';

class SliverRewardsList extends StatefulWidget {
  @override
  _SliverRewardsListState createState() => _SliverRewardsListState();
}

class _SliverRewardsListState extends State<SliverRewardsList> {
  @override
  Widget build(BuildContext context) {

    final userRewards = Provider.of<List<Reward>>(context) ?? [];

    // userRewards.forEach((reward) {
    //   print(reward.pnr);
    //   print(reward.rewardPoints);
    // });

    return SliverList(
      // key: ,
      delegate: SliverChildBuilderDelegate((context, index) {
        return RewardTile(reward: userRewards[index]);
      },
      childCount: userRewards.length
      ),
    );

    // return ListView.builder(
    //   itemCount: userRewards.length,
    //   itemBuilder: (context, index) {
    //     return RewardTile(reward: userRewards[index]);
    //   },
    // );


  }

}