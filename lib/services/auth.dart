import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/important/firestore.dart';
import 'package:flutter_app/important/firestorefb.dart';
import 'package:flutter_app/models/user.dart';


class AuthService {

  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//change user state from stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
    //.map((FirebaseUser user) => _userFromFirebaseUser(User));
  }

//signin  anonymous
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

Future registerWithEmailandPassword(String email,String password,{String a,String b,String c,String d,String e,String f,String g}) async{

  try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email.trim(),password: password);
    FirebaseUser user = result.user;
    await FireStoreDb(userid: user.uid).details(a, b, c, d, e,f,g);
    return _userFromFirebaseUser(user);
  }catch(e){
     print(e.toString());
     return null;
  }
}
 
Future signInWithEmailandPassword(String email,String password) async{

  try{
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email.trim(),password: password);
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
  }catch(e){
     print(e.toString());
     return null;
  }
}

//sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future feedBack({String a,String b,String c}) async{
     try{
        FirebaseUser result = await  _auth.currentUser();
    await FireStoreFb(userid: result.uid).details(a, b, c);
    return _userFromFirebaseUser(result);
  }catch(e){
     print(e.toString());
     return null;
  }
}
Future user1({String a,String b,String c,String d,String e,String f,String g}) async{
     try{
        FirebaseUser result = await  _auth.currentUser();
    await FireStoreDb(userid: result.uid).details(a, b, c,d,e,f,g);
    return _userFromFirebaseUser(result);
  }catch(e){
     print(e.toString());
     return null;
  }
}
}