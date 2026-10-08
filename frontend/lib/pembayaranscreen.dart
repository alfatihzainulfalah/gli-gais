import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/empty_state.dart';

class PembayaranScreen extends StatelessWidget {
  const PembayaranScreen({Key? key}) : super(key: key);

  static const Color textColor = Color(0xFF172B4D);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20, 32, 20, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Pembayaran",
              style: TextStyle(
                fontFamily: "Nexa Bold",
                fontSize: screenWidth / 18,
                color: textColor,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: EmptyState(
                icon: FontAwesomeIcons.moneyBillWave,
                title: "Belum Ada Tagihan",
                message: "Tagihan pembayaran kamu akan muncul di sini jika sudah tersedia.",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
