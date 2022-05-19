import 'package:flutter/material.dart';
import 'package:smart_plants_app/models/models.dart';

import '../widgets/profile_avatar.dart';

class EngineerDetails extends StatelessWidget {
  final EngineersModel engineersModel;
  const EngineerDetails({Key? key, required this.engineersModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Agriculture engineers"),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                margin:
                    EdgeInsets.fromLTRB(12.0, size.height * 0.17, 12.0, 24.0),
                width: size.width,
                height: size.height * 0.4,
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04,
                  vertical: size.height * 0.07,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 2.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text(
                        engineersModel.email,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 14.0),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Full name: ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: engineersModel.name),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Country: ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: engineersModel.country),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Sex: ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: engineersModel.sex),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Experience: ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: "+ " + engineersModel.years_experience,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: size.width * 0.34,
                top: size.width * 0.04,
                child: ProfileAvatar(
                  imageUrl: engineersModel.image,
                  isActive: engineersModel.connected,
                  size: 60.0,
                ),
              ),
            ],
          ),
          ElevatedButton(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  "Make a Call",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.videocam,
                  size: 20.0,
                  color: Colors.white,
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              onPrimary: Colors.white,
              shadowColor: Colors.greenAccent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              minimumSize: const Size(300, 50), //////// HERE
            ),
            onPressed: () => null,
          ),
        ],
      ),
    );
  }
}
