import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String name;

  const HomeHeader({Key? key, required this.name}) : super(key: key);

  static const Color primaryNavy = Color(0xFF174A96);
  static const Color textColor = Color(0xFF172B4D);
  static const Color secondaryText = Color(0xFF718096);
  static const Color border = Color(0xFFE2E8F0);

  String get _greeting {
    final hour = DateTime.now().hour;
    if (hour < 11) return "Selamat pagi,";
    if (hour < 15) return "Selamat siang,";
    if (hour < 18) return "Selamat sore,";
    return "Selamat malam,";
  }

  String get _initial =>
      name.trim().isEmpty ? "P" : name.trim()[0].toUpperCase();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: border, width: 1)),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: primaryNavy,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                _initial,
                style: const TextStyle(
                  fontFamily: "Nexa Bold",
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _greeting,
                    style: const TextStyle(
                      fontFamily: "NNexa Light",
                      fontSize: 13,
                      color: secondaryText,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: "Nexa Bold",
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Belum ada notifikasi")),
                );
              },
              tooltip: "Notifikasi",
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: primaryNavy,
                size: 22,
              ),
              splashRadius: 20,
            ),
          ],
        ),
      ),
    );
  }
}
