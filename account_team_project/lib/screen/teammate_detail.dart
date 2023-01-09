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
      appBar: AppBar(
          title: Text(person.name),
          leading: ElevatedButton(
            onPressed: () => {Navigator.of(context).pop()},
            // ignore: sort_child_properties_last
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 30,
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: Offset(-1, 2))
              ],
            ),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(5),
              fixedSize: Size(5, 5),
            ),
          )

          // IconButton(
          //   icon: Icon(Icons.arrow_back_ios_new_outlined),
          //   color: Colors.white,
          //   onPressed: () => Navigator.of(context).pop(),
          //   iconSize: 20.0,
          // ),
          ),
      body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: const EdgeInsets.all(8.0)),
                // this write for set circle avatar user
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(person.imgurl),
                ),

                // this padding is write for write student id
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "ID: ${person.studentId}",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 22.0, fontStyle: FontStyle.normal),
                  ),
                ),

                // This padding is for write nickname
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Nickname: ${person.nickname}",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18.0, fontStyle: FontStyle.normal),
                  ),
                ),

                // I set this Padding to write about facebook profile and make it
                // to route to facebook profile
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                        onPressed: () {
                          var facebook = person.Fpro;
                          openBrowser(facebook);
                        },
                        icon: Icon(Icons.facebook_rounded),
                        label: Text(person.name))),
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
