import 'package:cloud_firestore/cloud_firestore.dart';

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
}
