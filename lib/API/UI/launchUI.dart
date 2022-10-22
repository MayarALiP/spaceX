import 'package:flutter/material.dart';
import 'package:spacex/API/Models/model_4_launches.dart';
import 'package:spacex/API/repositories/launches_repo.dart';

class LaunchesConn extends StatefulWidget {
  const LaunchesConn({super.key});
  @override
  State<LaunchesConn> createState() => _LaunchesConnState();
}

class _LaunchesConnState extends State<LaunchesConn> {
  late Future<List<LaunchModel>> apiLaunOutput;

  @override
  void initState() {
    apiLaunOutput = LaunchApiRequests().launchesAPI();
    super.initState();
  }

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
                            border: Border.all(width: 1.5, color: Colors.red),
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Row(
                                children: [
                                  //image
                                  const CircleAvatar(
                                    backgroundColor: Colors.redAccent,
                                    //child: Image(image: NetworkImage(launches.)),
                                  ),

                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(60, 0, 0, 10),

                                    // Id
                                    child: Text("$launches.id",
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              // details
                              child: Text(
                                launches.details,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                //flightNumber
                                child: Text("$launches.flightNumber")),
                             Padding(
                              padding: const EdgeInsets.fromLTRB(140,0,0,0),

                              //success
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color> (
                                          (Set<MaterialState> states) {
                                        if (states.contains(
                                            MaterialState.pressed)) {
                                          return Colors.green;
                                        } else {
                                          return Colors.red;
                                        }
                                      },
                                  ),
                                  ),
                                  child: Text("$launches.success"),
                             ),
                           ),
                          ]),
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
