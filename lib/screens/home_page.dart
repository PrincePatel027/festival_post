import 'package:festival_post/utils/festival_data.dart';
import 'package:festival_post/utils/user_details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 80),
            CircleAvatar(
              radius: 50,
              backgroundImage: FileImage(UserDetailssss.imagePR),
            ),
            const SizedBox(height: 20),
            const Text(
              "Good Morning",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Mr. ${UserDetailssss.name}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height / 1.6,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.centerLeft,
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Icon(Icons.edit),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Setting",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Icon(Icons.settings),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Log-out",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                  Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF339F74),
        title: const Text(
          "Festival Post",
          style: TextStyle(color: Colors.white),
        ),
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
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                "${Festivals.festivals[index]['description']}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${Festivals.festivals[index]['date']}",
                                style: const TextStyle(
                                  fontSize: 12,
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
