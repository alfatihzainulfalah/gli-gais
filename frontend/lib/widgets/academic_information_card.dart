import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AcademicInformationCard extends StatelessWidget {
  final String dayDateLabel;
  final String timeRange;
  final String lecturerName;
  final String room;
  final String status;
  final Color statusBackgroundColor;
  final Color statusTextColor;
  final bool hasAbsen;
  final String? absenTime;
  final VoidCallback? onAbsenTap;

  const AcademicInformationCard({
    Key? key,
    required this.dayDateLabel,
    required this.timeRange,
    required this.lecturerName,
    required this.room,
    required this.status,
    required this.statusBackgroundColor,
    required this.statusTextColor,
    this.hasAbsen = false,
    this.absenTime,
    this.onAbsenTap,
  }) : super(key: key);

  static const Color primaryNavy = Color(0xFF174A96);
  static const Color textColor = Color(0xFF172B4D);
  static const Color secondaryText = Color(0xFF718096);
  static const Color mutedText = Color(0xFF94A3B8);
  static const Color border = Color(0xFFE2E8F0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: border),
        boxShadow: [
          BoxShadow(
            color: Color(0x14172B4D),
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(20, 18, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(FontAwesomeIcons.calendarDays, color: primaryNavy, size: 16),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Jadwal Kuliah Hari Ini",
                  style: TextStyle(
                    fontFamily: "Nexa Bold",
                    fontSize: 15,
                    color: textColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: statusBackgroundColor,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontFamily: "Nexa Bold",
                    fontSize: 11,
                    color: statusTextColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              dayDateLabel,
              style: TextStyle(
                fontFamily: "NNexa Light",
                fontSize: 12.5,
                color: mutedText,
              ),
            ),
          ),
          SizedBox(height: 16),
          Divider(height: 1, color: border),
          SizedBox(height: 16),
          _infoRow(FontAwesomeIcons.clock, timeRange),
          SizedBox(height: 10),
          _infoRow(FontAwesomeIcons.chalkboardUser, lecturerName),
          SizedBox(height: 10),
          _infoRow(FontAwesomeIcons.locationDot, room),
          if (onAbsenTap != null) ...[
            SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: hasAbsen ? null : onAbsenTap,
                icon: Icon(FontAwesomeIcons.fingerprint, size: 18),
                label: Text(
                  hasAbsen ? "Sudah Absen" : "Absen Sekarang",
                  style: TextStyle(fontFamily: "Nexa Bold", fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: primaryNavy,
                  disabledBackgroundColor: mutedText,
                  disabledForegroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
            ),
            if (hasAbsen && absenTime != null) ...[
              SizedBox(height: 10),
              Text(
                "Anda telah berhasil absen pada pukul $absenTime",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "NNexa Light",
                  fontSize: 12.5,
                  color: secondaryText,
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14, color: mutedText),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: "NNexa Light",
              fontSize: 13.5,
              color: secondaryText,
            ),
          ),
        ),
      ],
    );
  }
}
