import 'package:flutter/material.dart';

class LoanSuccessful extends StatelessWidget {
  const LoanSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.12,
            ),
            Text(
              "Loan Success",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            Column(
              children: [
                Text(
                  "Ulrich le Rocher",
                  style: TextStyle(
                    fontSize: 26.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.green.shade200,
              child: IconButton(
                icon: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Center(
                child: Text(
                  "Your loan offer have been sent successfully",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            ElevatedButton(
              child: Text(
                "Back to Home".toUpperCase(),
                style: TextStyle(fontSize: 14),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shadowColor: Colors.greenAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: const Size(200, 40), //////// HERE
              ),
              onPressed: () => null,
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Text(
              "See loan history",
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
