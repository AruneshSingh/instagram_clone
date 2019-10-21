import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {

  static final String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  String _email, _password;

  _submit() {
    if(_formkey.currentState.validate()){
      _formkey.currentState.save();
      print(_email);
      print(_password);
      // Logging in the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Instagram',
              style: TextStyle(fontFamily: 'Billabong', fontSize: 50),
            ),
            Form(
              key: _formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 30,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (input) => !input.contains('@')
                          ? 'Please enter a valid email'
                          : null,
                      onSaved: (input) => _email = input,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 30,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (input) =>
                          input.length < 6 ? 'Password is weak' : null,
                      onSaved: (input) => _password = input,
                      obscureText: true,
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  Container(
                    width: 250,
                    child: FlatButton(
                      onPressed: _submit,
                      color: Colors.blue,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    width: 250,
                    child: FlatButton(
                      onPressed: () => Navigator.pushNamed(context, SignupScreen.id),
                      color: Colors.blue,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
