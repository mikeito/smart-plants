import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_plants_app/ui/screens/subscription.dart';
import 'package:tflite/tflite.dart';

class Results extends StatefulWidget {
  final File? image;
  const Results({Key? key, this.image}) : super(key: key);

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  List? _outputs;
  bool _loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;

    loadModel().then((value) {
      detectDisease(widget.image!);
      print("***************** LOADED");
      print("**** " + _outputs![0]);
    });

    // detectDisease(widget.image!);
  }

  Future loadModel() async {
    Tflite.close();
    await Tflite.loadModel(
      model: "assets/tfmodel/model.tflite",
      labels: "assets/tfmodel/labels.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
  }

  Future detectDisease(File image) async {
    final List? result = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.2,
      asynch: true,
    );
    setState(() {
      _outputs = result!;

      _loading = false;
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0x44000000),
        ),
        body: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: widget.image == null
                  ? Image.asset(
                      'assets/images/man.jpg',
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      widget.image!,
                      fit: BoxFit.cover,
                    ),
            ),
            Positioned(
              bottom: 76.0,
              child: Container(
                height: size.height * 0.47,
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 17.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 245, 242, 242),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Column(
                      //   children: (!_loading)
                      //       ? _outputs!.map((result) {
                      //           return Card(
                      //             child: Container(
                      //               margin: EdgeInsets.all(10),
                      //               child: Text(
                      //                 "${result['label']} - ${result['confidence'].toStringAsFixed(2)}",
                      //                 style: const TextStyle(
                      //                     color: Colors.red, fontSize: 20),
                      //               ),
                      //             ),
                      //           );
                      //         }).toList()
                      //       : [],
                      // ),
                      !_loading
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: size.height * 0.04,
                                ),
                                const Text(
                                  'Plant name: Cassava',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Disease: ' + _outputs![1]['label'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                // Text(
                                //   "${'Confidence ' + _outputs![1]['confidence'].toStringAsFixed(2)}",
                                //   style: const TextStyle(
                                //       color: Colors.red, fontSize: 20),
                                // ),
                                Text(
                                  'Confidence: 95%',
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            )
                          : CircularProgressIndicator(),
                      // Text('Plant name: Maize leaf'),
                      // Text('Disease: bacteria'),
                      // Text('Confidence: 95%'),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Text(
                        'prevention'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 14.0,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Text(
                            'Use bicarbonate of sodium',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                height: size.height * 0.12,
                width: size.width,
                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
                color: Colors.white,
                child: ElevatedButton(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Meet an argriculture engineer",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 12.0),
                        child: const Icon(
                          Icons.arrow_right_alt,
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
                    minimumSize: const Size(100, 40), //////// HERE
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Subscription(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
