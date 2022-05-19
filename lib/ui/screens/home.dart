import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_weather_widget/open_weather_widget.dart';
import 'package:smart_plants_app/ui/screens/results.dart';
import 'package:smart_plants_app/ui/widgets/bottom_sheet_widget.dart';
import '../../data/data.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? image;
  String apiKey = dotenv.get('NEWS_API_KEY');
  // final List<NewsModel> news;

  Future pickImage(ImageSource source) async {
    try {
      final _image = await ImagePicker().pickImage(source: source);
      if (_image == null) return;
      final imageTem = File(_image.path);
      setState(() => image = imageTem);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Results(
            image: image,
          ),
        ),
      );
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * .05,
            vertical: size.width * .05,
          ),
          child: Column(
            children: [
              SizedBox(
                // color: Colors.pink,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Good morning"),
                        Text(
                          "Ulrich!",
                          style: TextStyle(fontSize: 26),
                        )
                      ],
                    ),
                    CircleAvatar(
                      radius: 18.0,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: AssetImage('assets/images/man.jpg'),
                    ),
                  ],
                ),
              ),
              OpenWeatherWidget(
                latitude: 4.0511,
                longitude: 9.7679,
                location: "Douala",
                height: 180,
                apiKey: apiKey,
                alignment: MainAxisAlignment.center,
                margin: EdgeInsets.all(5),
              ),
              Container(
                height: size.height * 0.20,
                margin: EdgeInsets.symmetric(
                  vertical: size.height * 0.04,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 2.0,
                  vertical: size.width * 0.04,
                ),
                color: Colors.grey.shade200,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.22,
                      // color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/scan.svg',
                            height: size.height * 0.06,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          const Text(
                            "Take a picture",
                            style: TextStyle(fontSize: 12.0),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right_sharp,
                      size: 30.0,
                    ),
                    SizedBox(
                      width: size.width * 0.22,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/writing.svg',
                            height: size.height * 0.06,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          const Text(
                            "Read diagnostics",
                            style: TextStyle(fontSize: 12.0),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right_sharp,
                      size: 30.0,
                    ),
                    SizedBox(
                      width: size.width * 0.22,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/pharmacy.svg',
                            height: size.height * 0.06,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          const Text(
                            "Take drugs",
                            style: TextStyle(fontSize: 12.0),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "take a picture",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 12.0),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        size: 20.0,
                        color: Colors.white,
                      ),
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
                onPressed: () {
                  _showMyBottomSheet();
                },
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Trending news"),
                      Text("see all"),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                    ),
                    height: size.height * 0.10,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: size.width * 0.20,
                              decoration: const BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7.0),
                                ),
                              ),
                              child: Image.asset(
                                newsModel[index].picture,
                                width: 44.0,
                                height: 44.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(newsModel[index].title),
                          ],
                        );
                      },
                      separatorBuilder: (context, _) => SizedBox(
                        width: size.width * 0.04,
                      ),
                      itemCount: newsModel.length,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMyBottomSheet() {
    showBottomSheet(
        context: context,
        elevation: 10.0,
        builder: (BuildContext context) {
          return Wrap(
            children: [
              Container(
                // height: 200.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Choose an option',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      height: 2.0,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.camera_alt_outlined,
                      ),
                      title: const Text(
                        'Use Camera',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => pickImage(ImageSource.camera),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.image_outlined,
                      ),
                      title: const Text(
                        'Use Gallery',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        pickImage(ImageSource.gallery);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Results(
                        //       image: image,
                        //     ),
                        //   ),
                        // );
                      },
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
