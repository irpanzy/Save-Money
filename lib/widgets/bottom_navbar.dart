import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex; 
  final Function(int) onTap; 

  BottomNavbar({required this.currentIndex, required this.onTap});

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
            icon: Icon(
              Icons.home,
              color: currentIndex == 0 ? Colors.black : Colors.grey, 
            ),
            onPressed: () => onTap(0), 
          ),
          IconButton(
            icon: Icon(
              Icons.history,
              color: currentIndex == 1 ? Colors.black : Colors.grey,
            ),
            onPressed: () => onTap(1),
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
                onPressed: () => onTap(2), 
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.category,
              color: currentIndex == 3 ? Colors.black : Colors.grey,
            ),
            onPressed: () => onTap(3),
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: currentIndex == 4 ? Colors.black : Colors.grey,
            ),
            onPressed: () => onTap(4),
          ),
        ],
      ),
    );
  }
}
