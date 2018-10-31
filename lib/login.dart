import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/views/homepage.dart';

class LoginPage extends StatefulWidget{
  static String tag = "signin";


  
  @override
  State createState() => new _LoginPageState();
}

  enum FormType {
  login,
  register
  }




class _LoginPageState extends State<LoginPage>{

  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave(){
      final form = formKey.currentState;
      if (form.validate()){
        form.save();
        return true;
       
      }
      return false;
    }

    void validateAndSubmit() async{
      if (validateAndSave()){
        try {
          if(_formType == FormType.login){

            FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email:_email, password:_password);
            print('Signed in: ${user.uid}');
            Navigator.of(context).pushReplacementNamed(HomePage.tag);
          
          }else{
            FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
            print('Register User: ${user.uid}');
           }
        }
        catch (e){
            print ('Error : $e');
        }
      }

    }

    void moveToRegister(){
      formKey.currentState.reset();

      setState(() {
           _formType = FormType.register;   
        });

    }

    void moveToLogin(){
      
      setState(() {
           _formType = FormType.login;   
        });

    }

    void resetPassword() async{
      
          // FirebaseUser user = await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);


    }




    
  
  @override
    Widget build(BuildContext context){
  
        return new Scaffold(
          backgroundColor: Colors.greenAccent,
          body: new Stack(
            fit: StackFit.expand,
            children: <Widget>[
               new Image(
              image: new AssetImage("assets/bg.png"),
                fit: BoxFit.cover,
              ),
              new Column( 
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:250.0),
                    child: new Image(
                    image: new AssetImage("assets/user.png"),
                    height: 80.0,
                    width: 80.0,
                    ),
                  ),
                 
                  new Form(
                    key: formKey,
                    child: new Container(
                      padding: const EdgeInsets.all(40.0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 40.0),
                                        child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                    children: buildInputs() + buildSubmitButtons(),
                  
                  ),
                                  ),

                )
              )
              

          ],)
        ],
      ),
    );
  }
  List<Widget> buildInputs(){
    return[
      new TextFormField(
                        style: new TextStyle(color: Colors.white),
                          decoration: new InputDecoration(
                    
                          
                            
                          
                          labelText: "Email",labelStyle: TextStyle(color: Colors.white),
                      
                          
                        
                        ),
                         keyboardType: TextInputType.text,
                  
                        validator: (value) => value.isEmpty?'Email cannot be empty' : null,
                        onSaved: (value) => _email = value,

                  ),
                  
                     new TextFormField(
                        style: new TextStyle(color: Colors.white),
                    
                      decoration: new InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white)
                      
                      ,
                    
                    ),
                    keyboardType: TextInputType.text,
                    obscureText:true ,
                    validator: (value) => value.isEmpty?'Password cannot be empty' : null ,
                    onSaved: (value) => _password = value,
                

                  ),
    ];

  }

  List<Widget> buildSubmitButtons(){
    if (_formType == FormType.login){
      return [
        Padding(
          padding: const EdgeInsets.only(top:15.0),
          child: new MaterialButton(color:Colors.white,
                      textColor: Colors.deepPurple,
                      child: new Text("LOGIN"),
                      onPressed: validateAndSubmit,
                      splashColor: Colors.deepPurpleAccent, ),
        ),
                    new FlatButton(
                      child: new Text('Reister',style: new TextStyle(fontSize: 18.0, color: Colors.white)),
                      onPressed: moveToRegister,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: new FlatButton(
                        child: new Text('Forgot Password',style: new TextStyle(fontSize: 10.0, color: Colors.white)),
                        onPressed: resetPassword,
                      ),
                    ),
      ];
    }else{
      return [
        new MaterialButton(color:Colors.white,
                    textColor: Colors.deepPurple,
                    child: new Text("Create an Account"),
                    onPressed: validateAndSubmit,
                    splashColor: Colors.deepPurpleAccent, ),
                    new FlatButton(
                      child: new Text('Have an account',style: new TextStyle(fontSize: 18.0, color: Colors.white)),
                      onPressed: moveToLogin,
                    ),
      ];

    }
  }

}
