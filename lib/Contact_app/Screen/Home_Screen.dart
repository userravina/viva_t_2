import 'package:flutter/material.dart';
import 'package:viva_t_2/Contact_app/Screen/resete.dart';

import 'Contacte_Screen.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: Colors.pink.shade50,
        bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.pink.shade100,
          currentIndex: i,
          type: BottomNavigationBarType.shifting,
          onTap: (value) {
            setState(() {
              i = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_rounded, size: 30),
                label: "",
                activeIcon: Icon(
                  Icons.grid_view_rounded,
                  size: 30,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.watch_later, size: 30),
                label: "",
                activeIcon: Icon(
                  Icons.watch_later,
                  size: 30,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 30),
                label: "",
                activeIcon: Icon(
                  Icons.person_add,
                  size: 30,
                )),
          ],
          selectedItemColor: Colors.pink.shade100,
          unselectedItemColor: Colors.black45,
        ),
        body: IndexedStack(
          index: i,
          children: [
            contacte(),
             Recents(),
            // Dialpad(),
          ],
        ),
      ),
    );
  }
}
