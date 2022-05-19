import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_plants_app/ui/screens/bottom_nav.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(child: BottomNav()),
      // home: const SafeArea(child: Subscription()),
      // home: const SafeArea(child: Engineers()),
      // home: const SafeArea(child: LoanSuccessful()),
      // home: const SafeArea(child: RequestLoan()),
      debugShowCheckedModeBanner: false,
    );
  }
}
