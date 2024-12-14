import 'package:first_app/home.dart';
import 'package:first_app/requirment.dart';
import 'package:flutter/material.dart';

class Bootombar extends StatefulWidget {
  final Map<dynamic, dynamic> response;
  const Bootombar({super.key, required this.response});

  @override
  State<Bootombar> createState() => _BootombarState();
}
 int _currentIndex=2;
class _BootombarState extends State<Bootombar> {
  late List<Widget> screens;
  int _currentIndex = 2;

  @override
  void initState() {
    super.initState();
    screens = [
      Home(),
      Messages(),
      HomeScreen(response: widget.response), // Access widget.response here
      Requirementdcreen(),
      Profile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return _currentIndex!=3? Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: const Icon(Icons.sort),
        actions: [const Icon(Icons.notifications_none)],
      ),
      body: screens[_currentIndex], // Correctly display the selected screen
      bottomNavigationBar: buildBottomNavigationBar(),
    ):const Requirementdcreen();
  }

  Widget buildBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            selectedItemColor: const Color(0xFF4A101D),
            unselectedItemColor: Colors.grey,
            items: [
              _buildBottomNavigationBarItem(Icons.home, 'Home', 0, _currentIndex),
              _buildBottomNavigationBarItem(Icons.message, 'Message', 1, _currentIndex),
              _buildBottomNavigationBarItem(Icons.attach_money, 'Sell', 2, _currentIndex),
              _buildBottomNavigationBarItem(Icons.calendar_today, 'Requirement', 3, _currentIndex),
              _buildBottomNavigationBarItem(Icons.person, 'Profile', 4, _currentIndex),
            ],
          ),
          // Enlarged Selected Icon
          Positioned(
            top: -20,
            left: (MediaQuery.of(context).size.width / 5) * _currentIndex +
                MediaQuery.of(context).size.width / 10 -
                25,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF4A101D),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getIconForIndex(_currentIndex),
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, String label, int index, int _currentIndex) {
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        width: 24,
        height: 24,
        child: Icon(
          icon,
          size: _currentIndex == index ? 15 : 24,
          color: _currentIndex == index
              ? const Color(0xFF4A101D)
              : Colors.grey,
        ),
      ),
      label: label,
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.message;
      case 2:
        return Icons.attach_money;
      case 3:
        return Icons.calendar_today;
      case 4:
        return Icons.person;
      default:
        return Icons.home;
    }
  }
}
