import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neworkx/core/app_colors.dart';
import 'package:neworkx/core/app_spacing.dart';
import 'package:neworkx/core/app_strings.dart';
import 'package:neworkx/core/font_manager.dart';
import 'package:neworkx/views/HomePage/details_home_screen.dart';
import 'package:neworkx/views/HomePage/notification.dart';
import 'package:neworkx/views/HomePage/value.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;

  // Pages for bottom navigation
  late final List<Widget> _pages = [
    const _HomeContent(), // Home page content
    const Center(child: Text("💼 Jobs Page")),
    const Center(child: Text("📚 Training Page")),
    const Center(child: Text("👤 Profile Page")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            activeIcon: Icon(Icons.work),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            activeIcon: Icon(Icons.school),
            label: 'Training',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage("assets/images/man.png")),
            AppSpacing.w8,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      AppStrings.homeProfileName,
                      style: FontManager.titleText(),
                    ),
                    AppSpacing.w10,
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Container(
                        width: 97.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            "JPLK1256QWM",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                AppSpacing.h2,
                Row(
                  children: [
                    Icon(Icons.work_outline_outlined, size: 16),
                    AppSpacing.w2,
                    Text(
                      AppStrings.homeProfileTitle,
                      style: FontManager.subtitleText(),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
              child: Icon(Icons.notifications),
            ),
          ],
        ),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row with two stat boxes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: StatBox(
                        icon: Icons.wifi_rounded,
                        value: "12,256",
                        label: "Live Jobs",
                        color: Colors.blue,
                      ),
                    ),
                    AppSpacing.w12,
                    Expanded(
                      child: StatBox(
                        icon: Icons.people_outline,
                        value: "5,678",
                        label: "Active Candidates",
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                AppSpacing.h12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: StatBox(
                        icon: Icons.work_outline_outlined,
                        value: "8,950",
                        label: "Completed Tasks",
                        color: Colors.orange,
                      ),
                    ),
                    AppSpacing.w12,
                    Expanded(
                      child: StatBox(
                        icon: Icons.star_border_rounded,
                        value: "1,245",
                        label: "Top Rated",
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
                AppSpacing.h14,
                Container(
                  width: double.infinity.w,
                  height: 66.h,
                  decoration: BoxDecoration(
                    color: AppColors.barFillColor,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.blue),
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(12.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              AppStrings.reminderLabel,
                              style: FontManager.boldSubtitleText(),
                            ),
                            Spacer(),
                            Text(
                              "19:33 PM",
                              style: FontManager.boldSubtitleText(),
                            ),
                          ],
                        ),
                        AppSpacing.h10,
                        Row(
                          children: [
                            Text(
                              AppStrings.reminderMessage,
                              style: FontManager.subtitleText(
                                fontSize: 10.sp,
                                color: Colors.black,
                              ),
                            ),
                            AppSpacing.w4,
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                child: Text(
                                  "Google",
                                  style: FontManager.generalText(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                AppSpacing.h10,

                /// Job cards
                JobCard(
                  logoPath: 'assets/images/lock.png',
                  companyName: 'Telegram',
                  deadline: '18 Jan, 2025',
                  jobTitle: 'Technical Head',
                  location: 'Jakarta, Indonesia - Onsite',
                  jobTags: ['Fulltime', 'Entry Level'],
                  description:
                      'It was popularised it was a test to overcome the pixel overflow issue. please check the state. in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages...',
                ),
                AppSpacing.h10,
                JobCard(
                  logoPath: 'assets/images/scale.png',
                  companyName: 'WhatsApp',
                  deadline: '20 Feb, 2025',
                  jobTitle: 'Back-End Developer',
                  location: 'California, USA',
                  jobTags: ['Fulltime', 'Internship'],
                  description:
                      'Lorem Ipsum has been the industry standard dummy text ever since the 1500s...',
                ),
                AppSpacing.h10,
                JobCard(
                  logoPath: 'assets/images/scale.png',
                  companyName: 'WhatsApp',
                  deadline: '20 Feb, 2025',
                  jobTitle: 'Back-End Developer',
                  location: 'California, USA',
                  jobTags: ['Fulltime', 'Internship'],
                  description:
                      'Lorem Ipsum has been the industry standard dummy text ever since the 1500s...',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final String logoPath; // logo under container
  final String companyName;
  final String deadline;
  final String jobTitle;
  final String location;
  final List<String> jobTags;
  final String description;

  const JobCard({
    super.key,
    required this.logoPath,
    required this.companyName,
    required this.deadline,
    required this.jobTitle,
    required this.location,
    required this.jobTags,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsHomeScreen()),
        );
      },
      child: Container(
        width: double.infinity.w,
        height: 178.h,
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row with logo and job info
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo/Company Icon
                Container(
                  width: 52.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset(logoPath, fit: BoxFit.fill),
                    ),
                  ),
                ),
                AppSpacing.w12,

                // Company info column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Company name and deadline badge row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            companyName,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[600],
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFF4CAF50),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Text(
                              'Deadline - $deadline',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      AppSpacing.h2,

                      // Job title
                      Text(
                        jobTitle,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      AppSpacing.h4,

                      // Location
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppSpacing.h12,

            // Tags row
            Row(
              children: jobTags
                  .map(
                    (tag) => Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: JobTag(label: tag),
                    ),
                  )
                  .toList(),
            ),

            AppSpacing.h10,

            // Description text
            Expanded(
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey[700],
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Custom widget for the stat boxes
class StatBox extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const StatBox({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    this.color = Colors.black, // default color if not provided
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Color(0xFFD4D4D4)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top row: icon + value
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 22),
              AppSpacing.w6,
              Text(
                value,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          AppSpacing.h6,
          // Bottom label
          Text(
            label,
            style: TextStyle(fontSize: 12.sp, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class JobTag extends StatelessWidget {
  final String label;

  JobTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 23.h,
        // width: 58.w,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: TextStyle(color: Colors.black, fontSize: 12.sp),
        ),
      ),
    );
  }
}
