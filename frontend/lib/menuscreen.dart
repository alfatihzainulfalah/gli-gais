import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'calendarscreen.dart';
import 'kuesionerscreen.dart';
import 'skripsiscreen.dart';
import 'wisudascreen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  static const Color textColor = Color(0xFF172B4D);

  static final List<_MenuItem> _items = [
    _MenuItem(
      icon: FontAwesomeIcons.clockRotateLeft,
      label: "Riwayat Absensi",
      builder: (context) => CalendarScreen(),
    ),
    _MenuItem(
      icon: FontAwesomeIcons.graduationCap,
      label: "Wisuda",
      builder: (context) => WisudaScreen(),
    ),
    _MenuItem(
      icon: FontAwesomeIcons.fileLines,
      label: "Skripsi",
      builder: (context) => SkripsiScreen(),
    ),
    _MenuItem(
      icon: FontAwesomeIcons.clipboardQuestion,
      label: "Kuesioner",
      builder: (context) => KuesionerScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Text(
              "Menu",
              style: TextStyle(
                fontFamily: "Nexa Bold",
                fontSize: screenWidth / 18,
                color: textColor,
              ),
            ),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.15,
              ),
              itemBuilder: (context, index) => _MenuTile(item: _items[index]),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String label;
  final WidgetBuilder builder;

  _MenuItem({required this.icon, required this.label, required this.builder});
}

class _MenuTile extends StatelessWidget {
  final _MenuItem item;

  const _MenuTile({Key? key, required this.item}) : super(key: key);

  static const Color primaryNavy = Color(0xFF174A96);
  static const Color textColor = Color(0xFF172B4D);
  static const Color border = Color(0xFFE2E8F0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: item.builder));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: border),
          boxShadow: [
            BoxShadow(
              color: Color(0x14172B4D),
              blurRadius: 16,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: primaryNavy.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(item.icon, color: primaryNavy, size: 20),
            ),
            SizedBox(height: 12),
            Text(
              item.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Nexa Bold",
                fontSize: 13,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
