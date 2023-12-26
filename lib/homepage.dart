import 'package:cardetail_project/addcar_page.dart';
import 'package:cardetail_project/car_list.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[AddCar(), CarList()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.deepPurple,
        iconSize: 35,
        gap: 10,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        tabs: const [
          GButton(
            icon: Icons.add,
            iconColor: Colors.white,
            text: 'Add Car',
          ),
          GButton(
            icon: Icons.list_sharp,
            iconColor: Colors.white,
            text: 'Car List',
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
