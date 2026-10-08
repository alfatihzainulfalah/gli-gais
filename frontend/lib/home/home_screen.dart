import 'package:employeeattendency/home/widgets/home_header.dart';
import 'package:employeeattendency/menuscreen.dart';
import 'package:employeeattendency/navigation/nav_bottom.dart';
import 'package:employeeattendency/pembayaranscreen.dart';
import 'package:employeeattendency/profilescreen.dart';
import 'package:employeeattendency/todayscreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String employeeName;

  const HomeScreen({Key? key, this.employeeName = "Pegawai"}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  static const Color bgColor = Color(0xFFF8FAFD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          HomeHeader(name: widget.employeeName),
          Expanded(
            child: IndexedStack(
              index: currentIndex,
              children: [
                TodayScreen(
                  onSeeAllMenu: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                ),
                const PembayaranScreen(),
                const MenuScreen(),
                const ProfileScreen(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBottom(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
