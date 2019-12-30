import 'package:flutter/material.dart';
import 'package:instagram/models/user_model.dart';
import 'package:instagram/utilities/constants.dart';

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
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            User user = User.fromDoc(snapshot.data);
            print(user.name);
            print(user.email);
            print(user.bio);
            return ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                          'https://icatcare.org/app/uploads/2018/07/Thinking-of-getting-a-cat.png'),
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
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Post',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    '1 M',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Followers',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    '1000',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Following',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: 200.0,
                            child: FlatButton(
                              onPressed: () => print("edit profile"),
                              color: Colors.blue,
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
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
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Username',
                      style:
                          TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 5.0,),
                    Container(
                      height: 80.0,
                      child: Text(
                        'biodata',
                        style: TextStyle(fontSize: 15.0),
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
