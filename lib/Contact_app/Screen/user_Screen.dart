import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viva_t_2/Contact_app/Screen/modal_contacte.dart';

import 'Contacte_Screen.dart';

class Call_Screen extends StatefulWidget {
  const Call_Screen({Key? key}) : super(key: key);
  @override
  State<Call_Screen> createState() => _Call_ScreenState();
}

List<Modal_class> favorites = [];
List<Modal_class> recents = [];
class _Call_ScreenState extends State<Call_Screen> {

  TextEditingController txtName = TextEditingController();
  TextEditingController txtnumber = TextEditingController();
  String? path;

  @override
  Widget build(BuildContext context) {
    int d = ModalRoute
        .of(context)!
        .settings
        .arguments as int;
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
            "User details",
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
          child: Column(
            children: [
              SizedBox(height: 70),
              Stack(
                alignment: Alignment(0, -1.5),
                children: [
                  Container(
                    height: 340,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.pink.shade50,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 3),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(top: 150),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              FloatingActionButton(
                                backgroundColor: Colors.green,
                                child: Icon(Icons.call),
                                onPressed: () async {
                                  await launchUrl(Uri.parse(
                                      "tel:${contactList[d].number}"));
                                },
                              ),
                              Spacer(),
                              FloatingActionButton(
                                backgroundColor: Colors.amber,
                                child: Icon(Icons.sms),
                                onPressed: () async {
                                  await launchUrl(Uri.parse("sms:8238266076"));
                                },
                              ),
                              Spacer(),
                              FloatingActionButton(
                                  backgroundColor: Colors.cyan,
                                  child: Icon(Icons.email),
                                  onPressed: () async {
                                    await launchUrl(Uri.parse(
                                        "mailto:ravinabaldaniya778@gmail.com"));
                                  }),
                              Spacer(),
                              FloatingActionButton(
                                  backgroundColor: Colors.brown,
                                  child: Icon(Icons.share),
                                  onPressed: () {
                                    Share.share("share these message");
                                  }),
                              Spacer(),
                            ])),
                  ),
               CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("assets/images/image3.jpeg")),
                  Padding(
                      padding: EdgeInsets.only(top: 130),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${contactList[d].name}",
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500)),
                          ])),
                  Padding(
                    padding: EdgeInsets.only(top: 160),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("  ${contactList[d].number}",
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 25,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 150,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.pink.shade50,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 5, spreadRadius: 3),
                  ],
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 160),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              contactList.removeAt(d);
                              Navigator.pop(context);
                            });
                          },
                          child: Text(
                            "Delate contactList", style: TextStyle(color: Colors
                              .red),
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: 160, top: 10, bottom: 10),
                        child: GestureDetector(
                            onTap: () {
                              alertedit(d);
                            },
                            child: Text("Update contactList", style: TextStyle(
                                color: Colors.pink),)),
                      ),
                      Divider(
                        height: 1,
                      ),
                      Container(height: 1,
                          width: double.infinity,
                          color: Colors.lightBlue.shade100),
                      Spacer(),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void alertedit(int index) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(shadowColor: Colors.black,
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 120, width: 120, alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.lightBlue.shade100,
                    image:
                    path == null ?
                    DecorationImage(image: AssetImage("assets/images/3.jpeg"),
                        fit: BoxFit.cover) :
                    DecorationImage(
                        image: FileImage(File("")), fit: BoxFit.cover)),
              ),
            ),
            SizedBox(height: 10),
            TextField(

              controller: txtName =
                  TextEditingController(text: "${contactList[index].name}"),
              style: TextStyle(fontSize: 20, color: Colors.blue.shade600),
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Name",
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                prefixIcon: Icon(Icons.person,
                    color: Colors.blue, size: 25),
              ),),
            SizedBox(height: 10),

            TextField(controller: txtnumber =
                TextEditingController(text: "${contactList[index].number}"),

              style: TextStyle(fontSize: 20, color: Colors.blue.shade600),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Name",
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                prefixIcon: Icon(Icons.call,
                    color: Colors.blue, size: 25),
              ),),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent.shade200),
              child: Text(" Update ", style: TextStyle(fontSize: 25)),
              onPressed: () {
                String tName = txtName.text;
                String tno = txtnumber.text;

                setState(() {
                  contactList[index] =
                      Modal_class(name: tName, number: tno, img: path);
                });

                Navigator.pop(context);
              },
            )
          ],
        ),
      );
    },);
  }
}

