import 'package:flutter/material.dart';
import 'package:viva_t_2/Multi_table/modal_multi_table.dart';

class Multi_table extends StatefulWidget {
  const Multi_table({Key? key}) : super(key: key);

  @override
  State<Multi_table> createState() => _Multi_tableState();
}
TextEditingController table= TextEditingController();
var a;
var b;
class _Multi_tableState extends State<Multi_table> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink.shade100,
          title: Text(
            "Multi_table",
            style: TextStyle(color: Colors.black),
          )),
      body: Column(
        children:[ Center(
            child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10,top: 70),
          child: TextField(
            controller: table,keyboardType: TextInputType.number,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.numbers, color: Colors.black),
                hintText: "Enter number:-",
                hintStyle: TextStyle(color: Colors.black),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink.shade200)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                    borderSide: BorderSide(color: Colors.pink.shade50))),onTap: () {
                    },
              ),
        ),),Padding(padding: EdgeInsets.only(top: 50),
          child: ElevatedButton(onPressed: () {
             String? no = table.text;
             int i= int.parse(no);
             modal d1 = modal(num:i);
             Navigator.pushNamed(context, 'show',arguments: d1);
          }, child: Text("Selecte",style: TextStyle(color: Colors.black),),style: ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade300)),
        )],
      ),
      backgroundColor: Colors.pink.shade100,
    ));
  }
}
