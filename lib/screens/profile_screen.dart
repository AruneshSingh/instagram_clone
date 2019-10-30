import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user_models.dart';
import 'package:instagram_clone/utilities/constants.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;
  ProfileScreen({this.userId});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: usersRef.document(widget.userId).get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }
          User user = User.fromDoc(snapshot.data);
          return ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://pbs.twimg.com/profile_images/814263074639187968/Ioh1Qvuc_400x400.jpg'),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    '12',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'posts',
                                    style: TextStyle(color: Colors.black54),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    '407',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'followers',
                                    style: TextStyle(color: Colors.black54),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    '399',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'following',
                                    style: TextStyle(color: Colors.black54),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: 200,
                            child: FlatButton(
                              onPressed: () => print('Edit Profile'),
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      user.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 80,
                      child: Text(
                        user.bio,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Divider(),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
