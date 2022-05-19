import 'package:flutter/material.dart';
import 'package:smart_plants_app/ui/screens/engineer_details.dart';
import 'package:smart_plants_app/ui/widgets/profile_avatar.dart';
import '../../data/data.dart';

class Engineers extends StatefulWidget {
  const Engineers({Key? key}) : super(key: key);

  @override
  State<Engineers> createState() => _EngineersState();
}

class _EngineersState extends State<Engineers> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final generatedListtile = <ListTile>[];

    for (var engineer in engineersData) {
      generatedListtile.add(
        ListTile(
          leading: ProfileAvatar(
            imageUrl: engineer.image,
            isActive: engineer.connected,
          ),
          title: Text(engineer.name),
          subtitle: RichText(
            text: TextSpan(
              text: engineer.email + '\n',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey),
              children: <TextSpan>[
                TextSpan(text: '+' + engineer.years_experience + ' Experience'),
              ],
            ),
          ),
          isThreeLine: true,
          horizontalTitleGap: 7.0,
          minVerticalPadding: 12.0,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EngineerDetails(
                  engineersModel: engineer,
                ),
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Agriculture engineers"),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: ListView(
            children: ListTile.divideTiles(
              context: context,
              tiles: generatedListtile,
            ).toList(),
          ),
        ));
  }
}
