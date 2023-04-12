import 'dart:io';
import 'package:flutter/material.dart';
import 'package:viva_t_2/Contact_app/Screen/modal_contacte.dart';

import 'Contacte_Screen.dart';

class Recents extends StatefulWidget {
  const Recents({Key? key}) : super(key: key);

  @override
  State<Recents> createState() => _RecentsState();
}

class _RecentsState extends State<Recents> {
  bool swi = false;
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink.shade50,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            ListTile(
                title: Text(
                  "Recents",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.pink),
                ),
                trailing: Icon(
                  Icons.edit_square,
                  color: Colors.pink,
                  size: 25,
                )),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 40,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: TextFormField(
                  controller: search,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search ",
                      prefixIcon:
                      Icon(Icons.search, color: Colors.grey.shade400)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Box(contactList[index]);
                },
                itemCount: contactList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Box(Modal_class c) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text("${c.name}",
            style: TextStyle(
                color: Colors.pink, fontWeight: FontWeight.w500, fontSize: 20)),
        trailing: Icon(Icons.info_outline, color: Colors.pink),
        leading: c.img == null
            ? CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(
                "assets/images/image3.jpeg",))
            : CircleAvatar(
            radius: 35, backgroundImage: FileImage(File("assets/images/image3.jpeg"))),
        subtitle: Text("+91 ${c.number}",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400)),
        tileColor: Colors.white,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
      ),
    );
  }
}


