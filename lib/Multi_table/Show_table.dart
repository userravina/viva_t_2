import 'package:flutter/material.dart';
import 'package:viva_t_2/Multi_table/Multi_table.dart';
import 'package:viva_t_2/Multi_table/modal_multi_table.dart';

class Show_table extends StatefulWidget {
  const Show_table({Key? key}) : super(key: key);

  @override
  State<Show_table> createState() => _Show_tableState();
}

class _Show_tableState extends State<Show_table> {
  @override
  Widget build(BuildContext context) {
    modal d= ModalRoute.of(context)!.settings.arguments as modal ;
    return SafeArea(
        child: Scaffold(appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.pink.shade100,
            title: Text(
              "table_Show",
              style: TextStyle(color: Colors.black),
            )),backgroundColor: Colors.pink.shade50,
          body: Padding(
              padding: EdgeInsets.only(top: 100),
              child: Expanded(
                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Expanded(
                      child: Padding(padding: EdgeInsets.only(left: 150),
                        child: ListView.builder(itemBuilder: (context, index) {
                          return Text('${d.num}*$index=${d.num! * index}');
                        },itemCount: 10+2-1,),
                      ),
                    )],),
              )),
        ));
  }
}
