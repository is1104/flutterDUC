import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  final Function toggelView;
  SignUp({this.toggelView});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthService _auth = AuthService();
  _SignUpState();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String nic = '';
  String fname = '';
  String lname = '';
  String addr = '';
  String dob = '';
  String phone = '';
  String error = '';
  File _image;
  @override
  Widget build(BuildContext context) {
    Future getImage() async{
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
        print('image path $_image');
      });
    }
    Future uploadPic() async{
      String fileName =basename(_image.path);
      StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot ss =await uploadTask.onComplete;
      setState(() {
        print("Profile Picture Uploaded");
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Profile Picture Uploaded"),));
      });
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          FlatButton.icon(
            label: Text('SIGN IN'),
            icon: Container(
                width: 30, child: Image.asset('assets/images/Logo.png')),
            onPressed: () {
              widget.toggelView();
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: new BoxDecoration(color: Color.fromARGB(180, 233, 3, 3)),
        ),
      ),
      //Form
      body: Container(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.blue,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                child: Material(
                  elevation: 10,
                  color: Colors.white,
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Material(
                                    elevation: 10,
                                    child: Container(
                                      height: 75,
                                      width: 75,
                                      child: ClipOval(
                                        
                                        child: SizedBox(
                                          width: 75,
                                          height: 75,
                                          child: (_image!=null)?Image.file(_image,fit:BoxFit.fill):Image.network(
                                            "https://vancityblog.azureedge.net/wp-content/uploads/2016/12/GiveHands-iStock-Blog-1280x620-1280x620.jpg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                 
                                ],
                              ),
                               Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: IconButton(
                                      icon: Icon(Icons.photo_camera),
                                      onPressed: (){
                                        getImage();
                                       // uploadPic();
                                      },
                                    ),
                                  ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'email',
                                  fillColor: Colors.grey,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0)),
                                ),
                                validator: (value) =>
                                    value.isEmpty ? 'Enter an email' : null,
                                onChanged: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'password',
                                  fillColor: Colors.grey,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0)),
                                ),
                                validator: (value) => value.length < 8
                                    ? 'Password must be atleast 8 characters'
                                    : null,
                                obscureText: true,
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'fName',
                                  fillColor: Colors.grey,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0)),
                                ),
                                validator: (value) =>
                                    value.isEmpty ? 'Enter Name' : null,
                                onChanged: (value) {
                                  setState(() {
                                    fname = value;
                                  });
                                },
                              ),
                               SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'lName',
                                  fillColor: Colors.grey,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0)),
                                ),
                                validator: (value) =>
                                    value.isEmpty ? 'Enter Name' : null,
                                onChanged: (value) {
                                  setState(() {
                                    lname = value;
                                  });
                                },
                              ),
                              SizedBox(height: 5,),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Address',
                                  fillColor: Colors.grey,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0)),
                                ),
                                validator: (value) =>
                                    value.isEmpty ? 'Enter address' : null,
                                onChanged: (value) {
                                  setState(() {
                                    addr = value;
                                  });
                                },
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'DOB',
                                  fillColor: Colors.grey,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0)),
                                ),
                                validator: (value) =>
                                    value.isEmpty ? 'Enter DOB' : null,
                                onChanged: (value) {
                                  setState(() {
                                    dob = value;
                                  });
                                },
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'NIC',
                                  fillColor: Colors.grey,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0)),
                                ),
                                validator: (value) =>
                                    value.isEmpty ? 'Enter a NIC' : null,
                                onChanged: (value) {
                                  setState(() {
                                    nic = value;
                                  });
                                },
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Phone Number',
                                  fillColor: Colors.grey,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0)),
                                ),
                                validator: (value) =>
                                    value.isEmpty ? 'Enter Phone Number' : null,
                                onChanged: (value) {
                                  setState(() {
                                    phone = value;
                                  });
                                },
                              ),
                              SizedBox(height: 5),
                              RaisedButton(
                                color: Colors.blue[900],
                                child: Text('SIGNUP',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () async {
                                
                                  if (_formKey.currentState.validate()) {
                                    dynamic result = await _auth
                                        .registerWithEmailandPassword(
                                            email, password,
                                            a: nic,
                                            b: addr,
                                            c: dob,
                                            d: phone,                                           
                                            e: (_image).toString(),
                                            g: fname,
                                            f:lname,);

                                    if (result == null) {
                                      setState(() => error =
                                          'password or email incorrect');
                                    }
                                  }
                                    uploadPic();
                                },
                              ),
                              SizedBox(height: 5),
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 12.0),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
