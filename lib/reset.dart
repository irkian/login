import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPassword extends StatefulWidget {
    static String tag = "forgetpw";

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

    final formK = new GlobalKey<FormState>();
    String mail;

  // resetPass() async {
  //     print(mail);
  //     await FirebaseAuth.instance.sendPasswordResetEmail(email:mail).whenComplete((){
          
  //       });
  //      }

  bool validateAndSave(){
      final form = formK.currentState;
      if (form.validate()){
        form.save();
        return true;
       
      }
      return false;
    }

       void validateAndSubmit() async{
      if (validateAndSave()){
        try {
          print("mail is : "+mail.toString());
          await FirebaseAuth.instance.sendPasswordResetEmail(email: mail);

          
          
          
        }
        catch (e){
            print ('Error : $e');
        }
      }

    }


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
            key: formK ,
            child: Padding(
              padding: const EdgeInsets.all(75.0),
              child: Center(
                child: new Container(
                  child: new Column(
                    
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
                          child: new Text("Reset"),
                          onPressed: validateAndSubmit,
                                                splashColor: Colors.deepPurpleAccent, ),
                                            
                                          ],
                                        ),
                                      ),
              ),
            ),
                                )
                              ],
                            )
                      
                      
                            
                          );
                        }
                      
                    
}