import 'package:UI/screens/screens.dart';
import 'package:flutter/material.dart';

class BottomNavScreen  extends StatefulWidget {
  BottomNavScreen ({Key key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen > {
  final List _screens=[
  HomeScreen(),
    StatsScreen(),
      Scaffold(),
    Scaffold(),
      Scaffold(),
   
  ];
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
    
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index)=>setState(()=>_currentIndex=index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      
        items: [Icons.home,Icons.insert_chart,Icons.event_note,Icons.info].asMap()
        .map((key, value) => MapEntry(
          key,
          BottomNavigationBarItem(
            title: Text(''),
            icon: Container(padding:const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
            decoration: BoxDecoration(color:_currentIndex==key?Colors.blue[600]:Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            
            ),
            child: Icon(value),
            
            ),
            
            
            ))).values.toList(),
      ),

    );
  }
}
