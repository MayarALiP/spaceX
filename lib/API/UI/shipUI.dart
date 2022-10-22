import 'package:flutter/material.dart';
import 'package:spacex/API/Models/model_4_ships.dart';
import 'package:spacex/API/repositories/ship_repo.dart';

class ShipsConn extends StatefulWidget {
  const ShipsConn({super.key});
  @override
  State<ShipsConn> createState() => _ShipsConnState();
}

class _ShipsConnState extends State<ShipsConn> {
  late Future<List<ShipsModel>> apishipOutput;
  @override
  void initState() {
    apishipOutput = ShipApiRequests().shipsAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<ShipsModel>>(
            future: apishipOutput,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      ShipsModel ship = snapshot.data![index];


                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 150,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.5, color: Colors.red),
                              borderRadius: BorderRadius.circular(20)
                          ),

                          child: Column(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Row(children: [
                                  // image
                                  CircleAvatar(
                                    radius: 20.0,
                                    child: Image.network(ship.image),
                                    // network is correct??<---------------
                                  ),
                                  //
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(60, 0, 0, 10),
                                    //
                                    //text NAme
                                    child: Text(ship.name,
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ]),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Row(
                                  children: [
                                    //ID
                                    Text(ship.id,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(140, 0, 0, 0),

                                      // active
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
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
                                        child: Text("$ship.active"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
