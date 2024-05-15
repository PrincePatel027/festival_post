import 'dart:io';

import 'package:festival_post/utils/user_details.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    ///
    TextEditingController nameController = TextEditingController();

    final GlobalKey<FormState> nameKey = GlobalKey<FormState>();

    pickImage() async {
      final picker = ImagePicker();
      final imagePicker = await picker.pickImage(source: ImageSource.gallery);

      if (imagePicker != null) {
        File fiePicker = File(imagePicker.path);
        setState(() {
          UserDetailssss.imagePR = fiePicker;
        });
      }
      //else {}
    }

    pickFromCamera() async {
      final picker = ImagePicker();
      final imagePicker = await picker.pickImage(source: ImageSource.camera);

      if (imagePicker != null) {
        File fiePicker = File(imagePicker.path);
        setState(() {
          UserDetailssss.imagePR = fiePicker;
        });
      } else {}
    }

    return Scaffold(
      backgroundColor: const Color(0xFF339F74),
      appBar: AppBar(
        backgroundColor: const Color(0xFF339F74),
        centerTitle: true,
        title: const Text(
          "Give Me Your Details",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Form(
        key: nameKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.withOpacity(0.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text("Pick Image"),
                                              content: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  FloatingActionButton(
                                                    onPressed: () {
                                                      pickFromCamera();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Icon(
                                                        Icons.camera),
                                                  ),
                                                  const SizedBox(width: 12),
                                                  FloatingActionButton(
                                                    child: const Icon(
                                                      Icons.photo,
                                                    ),
                                                    onPressed: () {
                                                      pickImage();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                      // pickFromCamera();
                                    },
                                    child: const CircleAvatar(
                                      radius: 15,
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                  UserDetailssss.imagePR != null
                                      ? CircleAvatar(
                                          radius: 80,
                                          backgroundImage:
                                              FileImage(UserDetailssss.imagePR),
                                        )
                                      : const CircleAvatar(
                                          radius: 80,
                                        ),
                                ],
                              ),
                            ),
                            const Text(
                              "Add Image",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Name",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Name first!!";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Enter Your Name Here",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // const SizedBox(height: 10),
                        // InkWell(
                        //   focusColor: const Color.fromARGB(255, 4, 126, 77),
                        //   onTap: () {
                        //     // if(nameKey.currentState!.validate)
                        //   },
                        //   child: Container(
                        //     height: 60,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(12),
                        //       color: const Color(0xFF339F74),
                        //     ),
                        //     alignment: Alignment.center,
                        //     child: const Text("Save"),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            if (nameKey.currentState!.validate()) {
              UserDetailssss.name = nameController.text;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Your Information Shaved Succesfully"),
                  action: SnackBarAction(label: "Next", onPressed: () {}),
                ),
              );
              Navigator.of(context).pushReplacementNamed("homePage");
            }
          },
          elevation: 10,
          backgroundColor: const Color.fromARGB(255, 51, 138, 103),
          child: const Icon(Icons.save),
        ),
      ),
    );
  }
}
