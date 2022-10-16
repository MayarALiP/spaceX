import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spacex/ui/start_tabs.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const StartTabs()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network("https://www.spacex.com/static/images/share.jpg"),
    );
  }
}
