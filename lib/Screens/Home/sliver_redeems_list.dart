import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Models/redeem.dart';
import 'redeems_tile.dart';

class SliverRedeemsList extends StatefulWidget {
  @override
  _SliverRedeemsListState createState() => _SliverRedeemsListState();
}

class _SliverRedeemsListState extends State<SliverRedeemsList> {
  @override
  Widget build(BuildContext context) {

    final userRedeems = Provider.of<List<Redeem>>(context) ?? [];

    // userRewards.forEach((reward) {
    //   print(reward.pnr);
    //   print(reward.rewardPoints);
    // });

    return SliverList(
      // key: ,
      delegate: SliverChildBuilderDelegate((context, index) { 
        return RedeemTile(redeem: userRedeems[index]);
      },
      childCount: userRedeems.length
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