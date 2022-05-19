import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smart_plants_app/ui/helpers/theme_helper.dart';
import 'package:smart_plants_app/ui/screens/loan_successful.dart';
import '../../data/data.dart';

class RequestLoan extends StatefulWidget {
  const RequestLoan({Key? key}) : super(key: key);

  @override
  State<RequestLoan> createState() => _RequestLoanState();
}

class _RequestLoanState extends State<RequestLoan> {
  final double min = 0;
  final double max = 40;
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "Request Loan",
          style: TextStyle(fontSize: 24.0, color: Colors.black),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        // elevation: ,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .02,
              // vertical: size.width * .05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  "Select Loans Amount",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Move the slider to select your amount",
                  style: TextStyle(fontSize: 18.0, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Center(
                  child: ElevatedButton(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.euro_sharp,
                          size: 16.0,
                        ),
                        Text(
                          "5",
                          style: TextStyle(
                            fontSize: 40.0,
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
                          borderRadius: BorderRadius.circular(14.0)),
                      minimumSize: const Size(250, 60), //////// HERE
                    ),
                    onPressed: () => null,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Row(
                  children: [
                    buildSideLabel(min),
                    Expanded(
                      child: Slider(
                        value: 0,
                        min: min,
                        max: max,
                        onChanged: (value) {
                          setState(() {
                            _currentValue = value;
                          });
                        },
                      ),
                    ),
                    buildSideLabel(max),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Text(
                  "Select Loans Teanure",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Choose your colateral term in month",
                  style: TextStyle(fontSize: 18.0, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                  height: size.height * 0.08,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: size.width * 0.17,
                        decoration: BoxDecoration(
                          color: monthData[index].selected
                              ? Colors.green
                              : Colors.white70,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7.0),
                          ),
                          border: Border.all(
                            width: 1.0,
                            color: Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            monthData[index].name.toUpperCase(),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, _) => SizedBox(
                      width: size.width * 0.04,
                    ),
                    itemCount: monthData.length,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Wrap(
                  children: const [
                    Text(
                      "If you need physical resources please type on the space below",
                      style: TextStyle(fontSize: 18.0, color: Colors.grey),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextFormField(
                  minLines: 2,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: "Enter your description",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Center(
                  child: ElevatedButton(
                    child: Text(
                      "Send my Offer".toUpperCase(),
                      style: const TextStyle(fontSize: 14),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      shadowColor: Colors.greenAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      minimumSize: const Size(290, 50), //////// HERE
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoanSuccessful(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSideLabel(double value) => SizedBox(
        width: 25,
        child: Text(
          value.round().toString(),
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      );
}
