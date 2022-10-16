import 'package:flutter/material.dart';
import 'package:spacex/API/UI/launchUI.dart';
import 'package:spacex/API/UI/shipUI.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.black,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              //Tab(text: ("Dragon")),
              Tab(text: ("Launches")),
              Tab(text: ("Ships")),
            ],
          ),
          title: const Text(
            'SpaceX',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
        ),
        //
        //
        body: const TabBarView(
          children: [
            // SizedBox(child: DragonConn()),
            //
            //
            SizedBox(child: LaunchesConn()),
            //
            //
            SizedBox(child: ShipsConn()),
            //
            //
          ],
        ),
      ),
    );
  }
}
