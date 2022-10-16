import 'package:flutter/material.dart';
import 'package:spacex/API/Models/model_4_launches.dart';
import 'package:spacex/API/repositories/launches_repo.dart';

class LaunchesConn extends StatefulWidget {
  const LaunchesConn({super.key});

  @override
  _LaunchesConnState createState() => _LaunchesConnState();
}

class _LaunchesConnState extends State<LaunchesConn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<LaunchModel>>(
            future: LaunchApiRequests().launchesAPI(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      LaunchModel launches = snapshot.data![index];

                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 150,
                          width: 50,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1.5, color: Colors.red)),
                          child: Column(
                            children: [
                              //title
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: Colors.redAccent,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          60, 0, 0, 10),
                                      child: Text(
                                        launches.missionName,
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //subtitle
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Row(
                                  children: [
                                    Text(
                                      launches.launchYear,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(140, 0, 0, 0),
                                      //child:
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return const Text("No data to show ");
              }
            }),
      ),
    );
  }
}
