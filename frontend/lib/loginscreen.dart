import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'home.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
  double screenHeight = 0;
  double screenWeight = 0;
  bool obscurePassword = true;
  
  static const Color primaryNavy = Color(0xFF174A96);
  static const Color darkNavy = Color(0xFF12366F);
  static const Color secondaryBlue = Color(0xFF2F6FD6);
  static const Color bgColor = Color(0xFFF8FAFD);
  static const Color textColor = Color(0xFF172B4D);
  static const Color secondaryText = Color(0xFF718096);

  @override
  Widget build(BuildContext context) {
    final bool iskeyboardvisible = KeyboardVisibilityProvider.isKeyboardVisible(context);
    screenHeight = MediaQuery.of(context).size.height;
    screenWeight = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgColor, 
      body: SingleChildScrollView(
        child: Column(
          children: [
            iskeyboardvisible ? SizedBox(height: screenHeight / 16) : header(),
            Container(
              margin: EdgeInsets.only(
                top: screenHeight / 18,
                left: screenWeight / 12,
                right: screenWeight / 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: screenWeight / 14,
                      fontFamily: "Nexa Bold",
                      color: textColor,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Silakan masuk untuk melanjutkan ke sistem.",
                    style: TextStyle(
                      fontSize: screenWeight / 28,
                      fontFamily: "NNexa Light",
                      color: secondaryText,
                    ),
                  ),
                  SizedBox(height: screenHeight / 35),
                  fieldTitle("NIM"),
                  customField(
                    hint: "Masukkan NIM Anda",
                    controller: idController,
                    icon: Icons.person_outline,
                  ),
                  fieldTitle("Password"),
                  customField(
                    hint: "Enter your password",
                    controller: passController,
                    icon: Icons.lock_outline,
                    isPassword: true,
                  ),
                  SizedBox(height: screenHeight / 50),
                  GestureDetector(
                    onTap: () {
                      final employeeName =
                          idController.text.trim().isEmpty ? "Pegawai" : idController.text.trim();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(employeeName: employeeName),
                        ),
                      );
                    },
                    child: Container(
                      height: 58,
                      width: screenWeight,
                      decoration: BoxDecoration(
                        color: primaryNavy,
                        borderRadius: BorderRadius.circular(29),
                        boxShadow: [
                          BoxShadow(
                            color: primaryNavy.withOpacity(0.3),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "LOGIN",
                            style: TextStyle(
                              fontFamily: "Nexa Bold",
                              fontSize: screenWeight / 26,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward, color: Colors.white, size: screenWeight / 22),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 20),
                ],
              ),
            ),
            footer(),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return ClipPath(
      clipper: _HeaderClipper(),
      child: Container(
        height: screenHeight / 2.6,
        width: screenWeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [darkNavy, primaryNavy],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenWeight / 3.2,
                height: screenWeight / 3.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 14,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    'images/logo-gli.png',
                    width: screenWeight / 5,
                    height: screenWeight / 5,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: screenHeight / 55),
              Text(
                "GAIS",
                style: TextStyle(
                  fontFamily: "Nexa Bold",
                  fontSize: screenWeight / 11,
                  color: Colors.white,
                  letterSpacing: 4,
                ),
              ),
              SizedBox(height: 4),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWeight / 7),
                child: Text(
                  "Institut Teknologi & Bisnis Bina Sarana Global",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: "NNexa Light",
                    fontSize: screenWeight / 34,
                    color: Colors.white.withOpacity(0.85),
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget footer() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: screenHeight / 60),
      alignment: Alignment.center,
      child: Text(
        "BERSAMA MEMBANGUN MASA DEPAN",
        style: TextStyle(
          fontFamily: "Nexa Bold",
          fontSize: screenWeight / 34,
          color: secondaryBlue.withOpacity(0.6),
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget fieldTitle(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 14),
      child: Text(
        title,
        style: TextStyle(
          fontSize: screenWeight / 28,
          fontFamily: "Nexa Bold",
          color: textColor,
        ),
      ),
    );
  }

  Widget customField({
    required String hint,
    required TextEditingController controller,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      width: screenWeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(icon, color: primaryNavy, size: screenWeight / 22),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              enableSuggestions: false,
              autocorrect: false,
              obscureText: isPassword ? obscurePassword : false,
              style: TextStyle(color: textColor, fontSize: screenWeight / 28),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: screenHeight / 45),
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(color: secondaryText),
              ),
              maxLines: 1,
            ),
          ),
          if (isPassword)
            Padding(
              padding: EdgeInsets.only(right: 14),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
                child: Icon(
                  obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: secondaryText,
                  size: screenWeight / 22,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
