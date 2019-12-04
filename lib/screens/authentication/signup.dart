import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';
class SignUp extends StatefulWidget {
  final Function toggelView;
  SignUp({this.toggelView});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   AuthService _auth = AuthService();
   final _formKey = GlobalKey<FormState>();
   String email ='';
  String password ='';
  String error = '';
  @override
  Widget build(BuildContext context) {
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
              icon: Container(width:30,child: Image.asset('assets/images/Logo.png')),
              onPressed: (){
                widget.toggelView();
              },
            ),
          ],
          flexibleSpace: Container(
            decoration:
                new BoxDecoration(color: Color.fromARGB(180, 233, 3, 3)),
          ),
        ),
      //Form
      body: Form(
         key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            
            children: <Widget>[
              SizedBox(height: 20,width: double.infinity,),
              TextFormField(
                validator: (value) => value.isEmpty ? 'Enter an email' : null,
                onChanged: (value){
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) => value.length<8? 'Password must be atleast 8 characters' : null,
                obscureText: true,
                onChanged: (value){
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                color: Colors.blue[900],
                child: Text('SIGNUP',style:TextStyle(color: Colors.white)),
                onPressed: ()async{
                   if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailandPassword(email, password);
                    if (result == null) {
                      setState(() => error = 'password or email incorrect');
                    }
                  }
                },
              ),
              SizedBox(height: 20,),
              Text(error,
              style: TextStyle(color: Colors.red,fontSize: 12.0),)

            ],
          ),
        ),
      ),
    );
  }
}