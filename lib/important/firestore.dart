import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/userinfomodel.dart';

class FireStoreDb {
  final String userid;
  FireStoreDb({this.userid});
  final CollectionReference userDetails =
      Firestore.instance.collection('userDetails');
  Future details(
      String nic, String addr, String dob, String name, String tp) async {
    return await userDetails.document(userid).setData({
      'address': addr,
      'dob': dob,
      'name': name,
      'nic': nic,
      'tp': tp,
    });
  }

  List<Info> _infoList(QuerySnapshot snapshot) {
    return snapshot.documents.map((a) {
      return Info(
        name: a.data['name'] ?? '',
        addr: a.data['addr'] ?? '',
        dob: a.data['dob'] ?? '',
        nic: a.data['nic'] ?? '',
        tp: a.data['tp'] ?? '',
      );
    }).toList();
  }

  Stream<List<Info>> get userDetail {
    return userDetails.snapshots()
    .map(_infoList);
  }
}
