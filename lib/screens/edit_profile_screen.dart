import 'dart:io';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user_models.dart';
import 'package:instagram_clone/services/database_services.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;

  EditProfileScreen({this.user});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  File _profileImage;
  String _name = '';
  String _bio = '';

  @override
  void initState() {
    super.initState();
    _name = widget.user.name;
    _bio = widget.user.bio;
  }

  _handleImageFromGallery() async {
    
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      //Update user database
      String profileImageUrl = '';
      User user = User(
        id: widget.user.id,
        name: _name,
        profileImageUrl: profileImageUrl,
        bio: _bio,
      );

      DatabaseService.updateUser(user);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://pbs.twimg.com/profile_images/814263074639187968/Ioh1Qvuc_400x400.jpg'),
                  ),
                  FlatButton(
                    onPressed: () => print('Change Profile'),
                    child: Text(
                      'Change Profile Avatar',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue: _name,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        size: 30,
                      ),
                      labelText: 'Name',
                    ),
                    validator: (input) => input.trim().length < 1
                        ? 'Please Enter a valid name'
                        : null,
                    onSaved: (input) => _name = input,
                  ),
                  TextFormField(
                    initialValue: _bio,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.book,
                        size: 30,
                      ),
                      labelText: 'Bio',
                    ),
                    validator: (input) => input.trim().length > 150
                        ? 'Please Enter a bio less than 150 characters'
                        : null,
                    onSaved: (input) => _bio = input,
                  ),
                  Container(
                    margin: EdgeInsets.all(40),
                    height: 40,
                    width: 250,
                    child: FlatButton(
                      onPressed: _submit,
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        'Save Profile',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
