import 'package:festival_post/utils/festival_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF339F74),
        title: const Text("Festival Post"),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF339F74),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: Festivals.festivals.length,
            itemBuilder: (BuildContext context, index) {
              return Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "${Festivals.festivals[index]['image']}",
                        ),
                        fit: BoxFit.cover,
                        // opacity: 0.9,
                      ),
                      gradient: const LinearGradient(
                        colors: [Colors.black, Colors.grey],
                        stops: [0.01, 0.9],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: MediaQuery.of(context).size.height / 3.6,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${Festivals.festivals[index]['name']}",
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "${Festivals.festivals[index]['description']}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${Festivals.festivals[index]['date']}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed("detailPage",
                                      arguments: index);
                                },
                                child: const Icon(
                                  Icons.arrow_circle_right_outlined,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //   Container(
                  //     height: MediaQuery.of(context).size.height / 3.6,
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(12),
                  //       // image: DecorationImage(
                  //       //     image: AssetImage(
                  //       //       "${Festivals.festivals[index]['image']}",
                  //       //     ),
                  //       //     fit: BoxFit.cover,
                  //       //     opacity: 0.5),
                  //       gradient: LinearGradient(
                  //         colors: [
                  //           Colors.black87.withOpacity(0.4),
                  //           Colors.lightBlueAccent.withOpacity(0.4),
                  //         ],
                  //         stops: const [0.2, 0.9],
                  //       ),
                  //     ),
                  //   ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
