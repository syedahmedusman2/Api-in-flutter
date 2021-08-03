import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Api extends StatefulWidget {

  @override
  _ApiState createState() => _ApiState();
}

class _ApiState extends State<Api> {
  getUser()async{
    var response = await http.get(Uri.https("jsonplaceholder.typicode.com", "users"));
    var jsonData = jsonDecode(response.body);
    List<User> users = [];

    for (var i in jsonData){
      User user = User(i['name'], i['username'], i['email']);
      users.add(user);
    }
    print(users);
    return users;
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(future: getUser(),
        builder: (BuildContext context,AsyncSnapshot snap){
          if (snap.data == null){
            return Container(child: Text("Nothing in the Api"));
          } else return ListView.builder(
            itemCount: snap.data.length,
            
            itemBuilder: (context,i){
              return ListTile(
                
                title: Center(child: Text(snap.data[i].user)),
                subtitle: Text(snap.data[i].username),
                trailing: Text(snap.data[i].email),

              );

          });
        },

        ),

      
      
    );
  }
}

class User{
  var user;
  var username;
  var email;
  User(this.user, this.username, this.email);
}