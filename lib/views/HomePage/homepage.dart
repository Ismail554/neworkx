import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neworkx/core/app_colors.dart';
import 'package:neworkx/core/app_spacing.dart';
import 'package:neworkx/core/app_strings.dart';
import 'package:neworkx/core/font_manager.dart';
import 'package:neworkx/views/HomePage/value.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/man.png"),
            ),
            AppSpacing.w8,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title + copy row
                Row(
                  children: [
                    Text(
                      AppStrings.homeProfileName,
                      style: FontManager.titleText(),
                    ),
                    AppSpacing.w10,
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: 97.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Center(
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
                // subline row
                Row(
                  children: [
                    const Icon(Icons.work_outline_outlined, size: 16),
                    AppSpacing.w2,
                    Text(
                      AppStrings.homeProfileTitle,
                      style: FontManager.subtitleText(),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.notifications),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Row with two stat boxes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      child: StatBox(
                        icon: Icons.wifi_rounded,
                        value: "12,256",
                        label: "Live Jobs",
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 12),
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
                  children: const [
                    Expanded(
                      child: StatBox(
                        icon: Icons.work_outline_outlined,
                        value: "8,950",
                        label: "Completed Tasks",
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(width: 12),
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
                // Reminder Section
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50, // Light blue background color
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // First Row with two texts
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Reminder",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '19:33 PM',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8), // Space between texts
                        // Second Row with the description text
                        Text(
                          "App development training in 2 hours",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(height: 8), // Space before button
                        // Google button
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4.h,
                            horizontal: 8.w,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Google",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
        border: Border.all(color: const Color(0xFFD4D4D4)),
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
