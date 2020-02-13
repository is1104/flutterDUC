import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/feedbackmodel.dart';

class FireStoreFb{
  final String userid;
  FireStoreFb({this.userid});
  final CollectionReference feedback =
      Firestore.instance.collection('feedBack');
  Future details(
      String about,String title , String message) async {
    return await feedback.document(userid).setData({
      'about': about,
      'title': title,
      'message': message,
    });
  }

  List<FeedInfo> _infoList(QuerySnapshot snapshot) {
    return snapshot.documents.map((a) {
      return FeedInfo(
        about: a.data['about'] ?? '',
        title: a.data['title'] ?? '',
        message: a.data['message'] ?? '',
      );
    }).toList();
  }

  Stream<List<FeedInfo>> get feedBack {
    return feedback.snapshots()
    .map(_infoList);
  }
}
