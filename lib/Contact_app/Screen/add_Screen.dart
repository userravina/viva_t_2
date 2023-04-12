import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viva_t_2/Contact_app/Screen/Contacte_Screen.dart';
import 'package:viva_t_2/Contact_app/Screen/modal_contacte.dart';


class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  var tetKey = GlobalKey<FormState>();
  String path = "";
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 20),
            child: InkWell(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.pink,
                size: 20,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: Text(
            "Add contact",
            style: TextStyle(color: Colors.pink, fontSize: 25),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 25),
              child: Icon(
                Icons.edit_square,
                color: Colors.pink,
                size: 25,
              ),
            ),
          ],
          backgroundColor: Colors.pink.shade50,
          elevation: 0,
        ),
        backgroundColor: Colors.pink.shade50,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70),
                Stack(
                  alignment: Alignment(0, -1.5),
                  children: [
                    Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                spreadRadius: 3),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: name,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.pink,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Name",
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.pink)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                prefixIcon: Icon(Icons.person_2_outlined,
                                    color: Colors.pink, size: 25),
                              ),validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter the value";
                              }
                            },

                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: number,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.phone,
                              cursorColor: Colors.pink,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Number",
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.pink)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                prefixIcon: Icon(Icons.phone_enabled_outlined,
                                    color: Colors.pink, size: 25),
                              ),validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter the value";
                              }
                            },

                            ),
                            SizedBox(height: 30),
                            Center(
                              child: InkWell(
                                onTap: () {
                                  Modal_class c1 = Modal_class(
                                    number: number.text,
                                    name: name.text,
                                    img: path,
                                  );
                                  contactList.add(c1);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    "Add Contact",
                                    style: TextStyle(
                                        color: Colors.pink.shade50,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    Stack(alignment: Alignment(1.2, 1), children: [
                      path == null
                          ? CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                            "https://www.nicepng.com/png/detail/811-8114232_silhouette-grey-person-icon.png"),
                      )
                          : CircleAvatar(
                        radius: 70,
                        backgroundImage: FileImage(File("$path")),
                      ),
                      FloatingActionButton(
                        mini: true,
                        onPressed: () {
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  'What do you want to take photos from?',
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      ImagePicker imagepicker = ImagePicker();
                                      XFile? xfile = await imagepicker.pickImage(source: ImageSource.gallery);
                                      setState(() {
                                        path = xfile!.path;
                                      });
                                    },
                                    child: Text("Galary"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pink,
                                    ),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                    onPressed: () async {
                                      ImagePicker imagepicker = ImagePicker();
                                      XFile? xfile =
                                      await imagepicker.pickImage(
                                          source: ImageSource.camera);
                                      setState(() {
                                         path = xfile!.path;
                                      });
                                    },
                                    child: Text("Camara"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pink,
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Icon(Icons.camera_alt_outlined,
                            color: Colors.white, size: 25),
                      ),
                    ]),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
