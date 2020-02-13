import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/userinfomodel.dart';

class FireStoreDb {
  final String userid;
  FireStoreDb({this.userid});
  final CollectionReference userDetails =
      Firestore.instance.collection('userDetails');
  Future details(
      String nic, String addr, String dob, String tp,String picURL,String fname,String lname) async {
    return await userDetails.document(userid).setData({
      'address': addr,
      'dob': dob,
      'fname': fname,
      'lname': lname,
      'nic': nic,
      'tp': tp,
      'picURL' : picURL,
    });
  }

  List<Info> _infoList(QuerySnapshot snapshot) {
    return snapshot.documents.map((a) {
      return Info(
        fname: a.data['fname'] ?? '',
        lname: a.data['lname'] ?? '',
        addr: a.data['addr'] ?? '',
        dob: a.data['dob'] ?? '',
        nic: a.data['nic'] ?? '',
        tp: a.data['tp'] ?? '',
        picURL: a.data['picURL'] ?? '',
      );
    }).toList();
  }

  Stream<List<Info>> get userDetail {
    return userDetails.snapshots()
    .map(_infoList);
  }
}
