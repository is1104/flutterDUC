import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/models/user.dart';


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user){
  return user != null ? User(uid: user.uid):null;
}

//change user state from stream
Stream<User> get user{
  return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  //.map((FirebaseUser user) => _userFromFirebaseUser(User));
}
//signin  anonymous
  Future signInAnon () async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
/*
Future registerWithEmailandPassword(String email,String password) async{

  try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email,password: password);
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
  }catch(e){
     print(e.toString());
     return null;
  }
}

Future signWithEmailandPassword(String email,String password) async{

  try{
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email,password: password);
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
  }catch(e){
     print(e.toString());
     return null;
  }
}

}*/

//sign out
Future signOut () async{
  try{
    return await _auth.signOut();  
  }catch(e){
    print(e.toString());
   return null;
  }
}
}