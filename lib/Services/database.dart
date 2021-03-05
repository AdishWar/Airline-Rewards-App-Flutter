import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/reward.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference userdata = FirebaseFirestore.instance.collection('userdata');

  // REMOVE
  Future updateUserData(List<String> pnr, List<int> rewardPoints) async {
    return await userdata.doc(uid).set({
      'pnrs': pnr,
      'rewards': rewardPoints,
    });
  }

  Future addNewReward(String pnr, int rewardPoints) async {
    return await userdata.doc(uid).collection('rewards').add({
      'rewardPoints': rewardPoints,
      'pnr': pnr
    });
  }

  // reward list from snapshot
  List<Reward> _rewardListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Reward(
        pnr: doc.data()['pnr'] ?? '',
        rewardPoints: doc.data()['rewardPoints'] ?? 0
      );
    }).toList();
  }

  Stream<List<Reward>> get userRewardsStream {
    // return userdata.doc(uid).collection('rewards').snapshots();
    return userdata.doc(uid).collection('rewards').snapshots().map(_rewardListFromSnapshot);
  }

}