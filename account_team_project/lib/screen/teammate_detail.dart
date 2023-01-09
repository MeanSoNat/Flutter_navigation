// ignore_for_file: prefer_const_constructors, deprecated_member_use, unused_local_variable, non_constant_identifier_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:account_team_project/team/mate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TeamDetail extends StatelessWidget {
  final Mate person;
  const TeamDetail({super.key, required this.person});
  openBrowser(String url) async {
    if (await canLaunchUrlString(url)) {
      await launch(url);
    } else {
      throw "Cannot open url $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(person.name)),
      body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: const EdgeInsets.all(8.0)),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(person.imgurl),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "ID: ${person.studentId}",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 22.0, fontStyle: FontStyle.normal),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Nickname: ${person.nickname}",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18.0, fontStyle: FontStyle.normal),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                        onPressed: () {
                          var facebook = person.Fpro;
                          openBrowser(facebook);
                        },
                        icon: Icon(Icons.facebook_rounded),
                        label: Text("Facebook"))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    person.description,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18.0, fontStyle: FontStyle.normal),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
