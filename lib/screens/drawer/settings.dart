import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:image_picker/image_picker.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  AuthService _auth = AuthService();
  _SettingsState();
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
            'Change User Detail',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          FlatButton.icon(
            label: Text('home'),
            icon: Container(
                width: 30, child: Image.asset('assets/images/Logo.png')),
            onPressed: () {
              
              
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
                                          child: (_image!=null)?Image.file(_image,fit:BoxFit.fill):Image.asset(
                                            'assets/images/Logo.png',
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
                               /* validator: (value) =>
                                    value.isEmpty ? 'Enter Name' : null,*/
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
                              /*  validator: (value) =>
                                    value.isEmpty ? 'Enter Name' : null,*/
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
                              /*  validator: (value) =>
                                    value.isEmpty ? 'Enter address' : null,*/
                                onChanged: (value) {
                                  setState(() {
                                    addr = value;
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
                              /*  validator: (value) =>
                                    value.isEmpty ? 'Enter Phone Number' : null,*/
                                onChanged: (value) {
                                  setState(() {
                                    phone = value;
                                  });
                                },
                              ),
                              SizedBox(height: 5),
                              RaisedButton(
                                color: Colors.blue[900],
                                child: Text('SUBMIT',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () async {
                                
                                  if (_formKey.currentState.validate()) {
                                    dynamic result = await _auth.user1(g: fname, b: addr,f:lname,d: phone,a: nic,c:dob);

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
