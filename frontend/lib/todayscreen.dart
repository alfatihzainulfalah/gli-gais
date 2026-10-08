import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'calendarscreen.dart';
import 'jadwalkuliahscreen.dart';
import 'kartuujianscreen.dart';
import 'khsscreen.dart';
import 'komponennilaiscreen.dart';
import 'krsscreen.dart';
import 'kuesionerscreen.dart';
import 'transkripnilaiscreen.dart';
import 'widgets/academic_information_card.dart';
import 'widgets/academic_menu_item.dart';

class TodayScreen extends StatefulWidget {
  final VoidCallback? onSeeAllMenu;

  const TodayScreen({Key? key, this.onSeeAllMenu}) : super(key: key);

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  static const Color bgColor = Color(0xFFF8FAFD);
  static const Color textColor = Color(0xFF172B4D);
  static const Color secondaryText = Color(0xFF718096);
  static const Color mutedText = Color(0xFF94A3B8);
  static const Color secondaryBlue = Color(0xFF2F6FD6);
  static const Color border = Color(0xFFE2E8F0);

  String? _absenTime;

  void _handleAbsen() {
    if (_absenTime != null) return;
    final now = TimeOfDay.now();
    setState(() {
      _absenTime =
          "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Absen berhasil dicatat pukul $_absenTime")),
    );
  }

  void _comingSoon(String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("$label akan segera hadir")),
    );
  }

  static const List<String> _dayNames = [
    "Minggu",
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
  ];
  static const List<String> _monthNames = [
    "",
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "Mei",
    "Jun",
    "Jul",
    "Agu",
    "Sep",
    "Okt",
    "Nov",
    "Des",
  ];

  String get _todayLabel {
    final now = DateTime.now();
    final day = _dayNames[now.weekday % 7];
    final date = now.day.toString().padLeft(2, '0');
    final month = _monthNames[now.month];
    return "$day, $date $month ${now.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AcademicInformationCard(
                dayDateLabel: _todayLabel,
                timeRange: "10:00 - 12:30",
                lecturerName: "Dr. Andi Pratama, M.Kom.",
                room: "Ruang 302, Gedung B",
                status: "Berlangsung",
                statusBackgroundColor: Color(0xFFDCFCE7),
                statusTextColor: Color(0xFF15803D),
                hasAbsen: _absenTime != null,
                absenTime: _absenTime,
                onAbsenTap: _handleAbsen,
              ),
              SizedBox(height: 24),
              _buildQuickMenu(),
              SizedBox(height: 28),
              _buildAnnouncements(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickMenu() {
    final items = <AcademicMenuItemData>[
      AcademicMenuItemData(
        icon: FontAwesomeIcons.clipboardList,
        label: "Kartu Rencana Studi",
        backgroundColor: Color(0xFFDBEAFE),
        iconColor: Color(0xFF1D4ED8),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => KrsScreen()),
        ),
      ),
      AcademicMenuItemData(
        icon: FontAwesomeIcons.calendarDays,
        label: "Jadwal Kuliah",
        backgroundColor: Color(0xFFCCFBF1),
        iconColor: Color(0xFF0F766E),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JadwalKuliahScreen()),
        ),
      ),
      AcademicMenuItemData(
        icon: FontAwesomeIcons.calendarCheck,
        label: "Daftar Kehadiran",
        backgroundColor: Color(0xFFDCFCE7),
        iconColor: Color(0xFF15803D),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CalendarScreen()),
        ),
      ),
      AcademicMenuItemData(
        icon: FontAwesomeIcons.graduationCap,
        label: "Kartu Hasil Studi",
        backgroundColor: Color(0xFFEDE9FE),
        iconColor: Color(0xFF7C3AED),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => KhsScreen()),
        ),
      ),
      AcademicMenuItemData(
        icon: FontAwesomeIcons.fileLines,
        label: "Transkrip Nilai",
        backgroundColor: Color(0xFFFEF3C7),
        iconColor: Color(0xFFB45309),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TranskripNilaiScreen()),
        ),
      ),
      AcademicMenuItemData(
        icon: FontAwesomeIcons.clipboardQuestion,
        label: "Kuesioner",
        backgroundColor: Color(0xFFFCE7F3),
        iconColor: Color(0xFFBE185D),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => KuesionerScreen()),
        ),
      ),
      AcademicMenuItemData(
        icon: FontAwesomeIcons.penToSquare,
        label: "Kartu Ujian",
        backgroundColor: Color(0xFFFFEDD5),
        iconColor: Color(0xFFC2410C),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => KartuUjianScreen()),
        ),
      ),
      AcademicMenuItemData(
        icon: FontAwesomeIcons.chartColumn,
        label: "Komponen Nilai",
        backgroundColor: Color(0xFFF1F5F9),
        iconColor: Color(0xFF475569),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => KomponenNilaiScreen()),
        ),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        crossAxisSpacing: 8,
        childAspectRatio: 0.78,
      ),
      itemBuilder: (context, index) => AcademicMenuItem(item: items[index]),
    );
  }

  Widget _buildAnnouncements() {
    final announcements = <_Announcement>[
      _Announcement(
        title: "Jadwal Ujian Tengah Semester",
        author: "Bagian Akademik",
        date: "05 Okt",
      ),
      _Announcement(
        title: "Panduan Pengisian KRS Semester Ganjil",
        author: "Bagian Akademik",
        date: "28 Sep",
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Pengumuman",
              style: TextStyle(
                fontFamily: "Nexa Bold",
                fontSize: 18,
                color: textColor,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => _comingSoon("Daftar pengumuman"),
              child: Text(
                "Lihat semua",
                style: TextStyle(
                  fontFamily: "Nexa Bold",
                  fontSize: 13,
                  color: secondaryBlue,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Container(
          width: double.infinity,
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Column(
            children: [
              for (int i = 0; i < announcements.length; i++) ...[
                if (i > 0) Divider(height: 1, color: border),
                _announcementRow(announcements[i]),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _announcementRow(_Announcement item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Color(0xFFFEF3C7),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Icon(FontAwesomeIcons.bullhorn, size: 13, color: Color(0xFFB45309)),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Nexa Bold",
                    fontSize: 14,
                    color: textColor,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  item.author,
                  style: TextStyle(
                    fontFamily: "NNexa Light",
                    fontSize: 12,
                    color: secondaryText,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Text(
            item.date,
            style: TextStyle(
              fontFamily: "NNexa Light",
              fontSize: 12,
              color: mutedText,
            ),
          ),
        ],
      ),
    );
  }
}

class _Announcement {
  final String title;
  final String author;
  final String date;

  const _Announcement({required this.title, required this.author, required this.date});
}
