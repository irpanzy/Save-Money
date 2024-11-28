import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final BuildContext context;

  BottomNavbar(this.context);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          IconButton(
            icon: Icon(Icons.history, color: Colors.grey),
            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
          ),
          Container(
            width: 50, 
            height: 55, 
            decoration: BoxDecoration(
              color: Color(0xFFB2E600), 
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Center(
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.white, size: 20), 
                onPressed: () {
                  Navigator.pushNamed(context, '/add');
                },
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.category, color: Colors.grey),
            onPressed: () {
              Navigator.pushNamed(context, '/statistik');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.grey),
            onPressed: () {
              Navigator.pushNamed(context, '/setting');
            },
          ),
        ],
      ),
    );
  }
}
