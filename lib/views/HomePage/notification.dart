import 'package:flutter/material.dart';
import 'package:neworkx/core/app_colors.dart';
import 'package:neworkx/core/app_spacing.dart';
import 'package:neworkx/core/app_strings.dart';
import 'package:neworkx/core/font_manager.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.notification,
          style: FontManager.boldTitleText(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          AppSpacing.h16,

          // Job Applied Notification
          _buildNotificationCard(
            title: "Job Applied",
            description: "You've successfully applied for this job.",
            time: "Just now",
            icon: Icons.notifications,
            iconColor: Colors.black,
            iconBackground: Colors.black,
          ),

          // Job Rejected Notification
          _buildNotificationCard(
            title: "Job Rejected",
            description: "Your application was not selected this time.",
            time: "10 mins ago",
            icon: Icons.cancel_outlined,
            iconColor: Colors.amber,
          ),

          // Training Applied Notification
          _buildNotificationCard(
            title: "Training Applied",
            description: "Your training request has been submitted.",
            time: "10 mins ago",
            icon: Icons.task_alt_outlined,
            iconColor: Colors.green,
            iconBackground: Colors.blue.shade50,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard({
    required String title,
    required String description,
    required String time,
    required IconData icon,
    Color? iconBackground,
    Color iconColor = Colors.grey,
  }) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon with background
              Icon(icon, size: 24, color: iconColor),
              AppSpacing.w12,

              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    AppSpacing.h4,

                    // Description
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        height: 1.4,
                      ),
                    ),
                    AppSpacing.h8,

                    // Time
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Divider at the bottom of each card
        Divider(color: Colors.grey.shade300, thickness: 1, height: 1),
      ],
    );
  }
}
