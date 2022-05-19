import 'package:flutter/material.dart';
import 'package:smart_plants_app/ui/screens/engineers.dart';
import 'package:smart_plants_app/ui/screens/home.dart';
import 'package:smart_plants_app/ui/screens/request_loan.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTab = 0;
  // list of tabs
  final List<Widget> screens = [
    const Home(),
    const Engineers(),
    const RequestLoan(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.qr_code_scanner_outlined),
        backgroundColor: Colors.green,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //***
              // two left-most icons
              // */
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Home();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: currentTab == 0 ? Colors.green : Colors.grey,
                          size: 28.0,
                        ),
                        // Text(
                        //   "Home",
                        //   style: TextStyle(
                        //     color: currentTab == 0 ? Colors.blue : Colors.red,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_none_sharp,
                          color: currentTab == 1 ? Colors.green : Colors.grey,
                          size: 28.0,
                        ),
                        // Text(
                        //   "Home",
                        //   style: TextStyle(
                        //     color: currentTab == 0 ? Colors.blue : Colors.red,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ],
              ),
              //**
              // two right most icons
              // */
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const RequestLoan();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.money,
                          color: currentTab == 2 ? Colors.green : Colors.grey,
                          size: 28.0,
                        ),
                        // Text(
                        //   "Home",
                        //   style: TextStyle(
                        //     color: currentTab == 0 ? Colors.blue : Colors.red,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Engineers();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: currentTab == 3 ? Colors.green : Colors.grey,
                          size: 28.0,
                        ),
                        // Text(
                        //   "Home",
                        //   style: TextStyle(
                        //     color: currentTab == 0 ? Colors.blue : Colors.red,
                        //   ),
                        // )
                      ],
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
}
