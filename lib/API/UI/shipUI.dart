import 'package:flutter/material.dart';
import 'package:spacex/API/Models/model_4_ships.dart';
import 'package:spacex/API/repositories/ship_repo.dart';

class ShipsConn extends StatefulWidget {
  const ShipsConn({super.key});

  @override
  _ShipsConnState createState() => _ShipsConnState();
}

class _ShipsConnState extends State<ShipsConn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<ShipsModel>>(
            future: ShipApiRequests().shipsAPI(),
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
                                    Container(
                                      width: 80,
                                      height: 80,
                                      //child: Image.network(ship.flickrImages[1]),
                                      // fit:BoxFit.contain,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.red, width: 1)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          60, 0, 0, 10),
                                      child: Text(
                                        ship.shipName,
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
                                      ship.shipModel,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          140, 0, 0, 0),
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
                                              // Use the component's default.)
                                            },
                                          ),
                                        ),
                                        child: Text(ship.shipModel),
                                      ),
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
