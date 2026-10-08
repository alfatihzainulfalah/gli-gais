import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/empty_state.dart';

class KuesionerScreen extends StatelessWidget {
  const KuesionerScreen({Key? key}) : super(key: key);

  static const Color primaryNavy = Color(0xFF174A96);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryNavy,
        foregroundColor: Colors.white,
        title: Text("Kuesioner", style: TextStyle(fontFamily: "Nexa Bold")),
      ),
      body: Center(
        child: EmptyState(
          icon: FontAwesomeIcons.clipboardQuestion,
          title: "Kuesioner",
          message: "Belum ada kuesioner yang perlu diisi saat ini.",
        ),
      ),
    );
  }
}
