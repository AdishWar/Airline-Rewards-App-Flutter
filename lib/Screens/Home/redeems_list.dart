import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_miles/Models/redeem.dart';
import 'package:sky_miles/Screens/Home/redeems_tile.dart';

class RedeemsList extends StatefulWidget {
  @override
  _RedeemsListState createState() => _RedeemsListState();
}

class _RedeemsListState extends State<RedeemsList> {

  @override
  Widget build(BuildContext context) {
     final userRedeems = Provider.of<List<Redeem>>(context) ?? [];
    
    return ListView.builder(
      itemCount: userRedeems.length,
      itemBuilder: (context, index) {
        return RedeemTile(redeem: userRedeems[index]);
      },
    );
  }
}

// implement teh Listview, but first youll have to set the provider