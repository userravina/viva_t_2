import 'dart:io';

import 'package:flutter/material.dart';
import 'package:viva_t_2/Contact_app/Screen/modal_contacte.dart';

class contacte extends StatefulWidget {
  const contacte({Key? key}) : super(key: key);

  @override
  State<contacte> createState() => _contacteState();
}
List<Modal_class> contactList = [
  Modal_class(
   name: "ravina",
    number: "12345678910"

  ),
  Modal_class(name: "khushi",number: "12345678910"
     ),
  Modal_class(
   name: "druvi",number: "12345678910"
  ),
];
String path = "";
int i = 0;

class _contacteState extends State<contacte> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(  appBar: AppBar(centerTitle: true,
          title: Text(
            "Contacte",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.pink.shade100),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              "add_Screen",
            ).then(
                  (value) {
                setState(() {});
              },
            );
          },
          child: Icon(
            Icons.add,
            size: 25,
            color: Colors.white,
          ),elevation: 1,
          backgroundColor: Colors.pink.shade200,
        ),
        backgroundColor: Colors.pink.shade50,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text(
                  "My contacts",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.pink.shade300,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: contactList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'user',
                                arguments: index).then( (value) {
                              setState(() {
                              });
                            });
                          },
                          child: set(contactList[index]));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget set(Modal_class c1) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 60,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.pink.shade100,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 2, offset: Offset(5, 5)),
            ]),
        child: ListTile(
          leading: c1.img == null
              ? CircleAvatar(
              backgroundImage: AssetImage("assets/images/image3.jpeg"),
              radius: 17)
              : CircleAvatar(
              backgroundImage: FileImage(
                File("${c1.img}"),
              ),
              radius: 17),
          title: Text(
            "${c1.name}",
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
      ),
      ),
    );
  }
}

