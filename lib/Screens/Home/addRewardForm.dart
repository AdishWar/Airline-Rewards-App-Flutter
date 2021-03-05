import 'package:flutter/material.dart';
import 'package:sky_miles/Services/database.dart';
import '../../Shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:sky_miles/Models/MyUser.dart';


class AddRewardForm extends StatefulWidget {
  @override
  _AddRewardFormState createState() => _AddRewardFormState();
}

class _AddRewardFormState extends State<AddRewardForm> {

  final _formKey = GlobalKey<FormState>();

  String _pnr = '';
  int _rewards = 0;

  @override
  Widget build(BuildContext context) {
    
    final uid = Provider.of<MyUser>(context).userid;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Add a new reward',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'PNR'),
            validator: (val) => val.length != 6 ? 'Please enter valid PNR' : null,
            onChanged: (val) => setState(() => _pnr = val),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Reward points'),
            validator: (val) => val.isEmpty ? 'Please enter valid Reward Points' : null,
            onChanged: (val) => setState(() => _rewards = int.parse(val)),
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                await DatabaseService(uid: uid).addNewReward(_pnr, _rewards);
              }
            },
            color: Colors.blue[600],
            child: Text('Add', style: TextStyle(color: Colors.white),)
          )
        ],
      ),
    );
  }
}