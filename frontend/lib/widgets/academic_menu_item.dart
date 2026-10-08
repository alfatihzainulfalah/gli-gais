import 'package:flutter/material.dart';

class AcademicMenuItemData {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onTap;

  const AcademicMenuItemData({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.iconColor,
    required this.onTap,
  });
}

class AcademicMenuItem extends StatelessWidget {
  final AcademicMenuItemData item;

  const AcademicMenuItem({Key? key, required this.item}) : super(key: key);

  static const Color textColor = Color(0xFF172B4D);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: item.onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: item.backgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: Icon(item.icon, color: item.iconColor, size: 22),
            ),
            SizedBox(height: 8),
            Text(
              item.label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "NNexa Light",
                fontSize: 11.5,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
