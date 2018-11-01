import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPassword extends StatefulWidget {
    static String tag = "forgetpw";

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

    final form = new GlobalKey<FormState>();
    String mail;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: new AssetImage("assets/bg.png"),
                fit: BoxFit.cover,
          ),

          new Form(
            key: form ,
            child: new Container(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new TextFormField(
                    style: new TextStyle(color: Colors.white),
                          decoration: new InputDecoration(
                    
                          
                            
                          
                          labelText: "Email",labelStyle: TextStyle(color: Colors.white),
                      
                          
                        
                        ),
                         keyboardType: TextInputType.text,
                  
                        validator: (value) => value.isEmpty?'Email cannot be empty' : null,
                        onSaved: (value) => mail = value,

                        
                  ),

                      new MaterialButton(color:Colors.white,
                      textColor: Colors.deepPurple,
                      child: new Text("LOGIN"),
                      onPressed: resetPass,
                                            splashColor: Colors.deepPurpleAccent, ),
                                        
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                      
                      
                            
                          );
                        }
                      
                         resetPass() async {
                           await FirebaseAuth.instance.sendPasswordResetEmail(email:mail).whenComplete((){
                                
                             });
  }
}