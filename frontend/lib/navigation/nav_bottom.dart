import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBottom extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const NavBottom({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  static const List<IconData> _navigationIcon = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.wallet,
    FontAwesomeIcons.tableCells,
    FontAwesomeIcons.user,
  ];

  static const List<String> _navigationLabel = [
    "Beranda",
    "Pembayaran",
    "Menu",
    "Akun",
  ];

  static const Color _primary = Color(0xFF174A96);
  static const Color _inactive = Color(0xFF718096);
  static const Color _border = Color(0xFFE2E8F0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 68,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: _border, width: 1)),
        boxShadow: [
          BoxShadow(
            color: Color(0x14172B4D),
            blurRadius: 16,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < _navigationIcon.length; i++)
              Expanded(
                child: GestureDetector(
                  onTap: () => onTap(i),
                  behavior: HitTestBehavior.opaque,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _navigationIcon[i],
                        color: i == currentIndex ? _primary : _inactive,
                        size: i == currentIndex ? 22 : 20,
                      ),
                      SizedBox(height: 4),
                      Text(
                        _navigationLabel[i],
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: i == currentIndex ? FontWeight.w600 : FontWeight.w500,
                          color: i == currentIndex ? _primary : _inactive,
                        ),
                      ),
                      i == currentIndex
                          ? Container(
                              margin: EdgeInsets.only(top: 4),
                              height: 3,
                              width: 22,
                              decoration: BoxDecoration(
                                color: _primary,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            )
                          : SizedBox(height: 7),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
