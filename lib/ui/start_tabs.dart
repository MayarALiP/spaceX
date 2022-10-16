import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:spacex/ui/logIn_screen.dart';

class StartTabs extends StatefulWidget {
  const StartTabs({super.key});
  @override
  _StartTabsState createState() => _StartTabsState();
}

class _StartTabsState extends State<StartTabs> {
  void _EndIntro(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const LogInScreen()));
  }

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Padding(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child: Container(
              width: 800,
              height: 800,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 2),
                image: const DecorationImage(
                    image: NetworkImage('https://i.redd.it/d79aqjbeqpn11.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        title: "Rocket engines",
        body: "The company has developed three families of rocket engines ",
        decoration: const PageDecoration(
            pageColor: Colors.black,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
            bodyTextStyle: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      PageViewModel(
        image: Padding(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 2),
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://space.skyrocket.de/img_sat/crew-dragon__1.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        title: 'Dragon Spacecraft',
        body:
            "SpaceX announced plans to pursue a human-rated commercial space program through the end of the decade",
        decoration: const PageDecoration(
            pageColor: Colors.black,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
            bodyTextStyle: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      PageViewModel(
        image: Padding(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 2),
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://spacenews.com/wp-content/uploads/2020/01/48380511427_eeafd03bd7_k.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        title: 'Launch Vehicles',
        body:
            "Falcon 1 was a small racket capable of placing several hundred Kms into low earth orbit",
        decoration: const PageDecoration(
            pageColor: Colors.black,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
            bodyTextStyle: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
            showSkipButton: true,
            globalBackgroundColor: Colors.black,
            next: const Text(
              "Next",
              style: TextStyle(color: Colors.red),
            ),
            skip: const Text("Skip", style: TextStyle(color: Colors.red)),
            done: const Text("Done", style: TextStyle(color: Colors.red)),
            onDone: () {
              _EndIntro(context);
            },
            onSkip: () {
              _EndIntro(context);
            },
            pages: getPages()));
  }
}
