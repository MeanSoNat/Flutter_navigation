import 'package:account_team_project/screen/teammate_detail.dart';
import 'package:flutter/material.dart';
import 'package:account_team_project/team/mate.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: const Color(0xFF00E5EE),
          leading: const Icon(
            Icons.person,
            size: 30,
            shadows: <Shadow>[
              Shadow(
                  color: Colors.black12, blurRadius: 10.0, offset: Offset(2, 2))
            ],
          ),
          leadingWidth: 100,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
          ),
          title: const Text(
            "Team List",
            style: TextStyle(color: Colors.black38, fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: teammate.length,
            itemBuilder: (context, index) {
              Mate team = teammate[index];
              return Card(
                child: ListTile(
                  title: Text(team.name),
                  subtitle: Text(team.studentId),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(team.imgurl),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeamDetail(person: team)));
                  },
                ),
              );
            }));
  }
}
