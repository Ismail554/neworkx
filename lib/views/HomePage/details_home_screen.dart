import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neworkx/core/app_colors.dart';
import 'package:neworkx/core/app_spacing.dart';
import 'package:neworkx/core/app_strings.dart';
import 'package:neworkx/core/font_manager.dart';

class DetailsHomeScreen extends StatelessWidget {
  const DetailsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.detailsPageTitle, style: FontManager.bigTitle()),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.greyE8,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      width: 52,
                      height: 52,
                      child: Image.asset("assets/icons/red_image.png"),
                    ),
                    AppSpacing.w10,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Company name and deadline badge row
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.detailsCompanyTelegram,
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
                                  "Hello",
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
                            AppStrings.jobTitleTechnicalHead,
                            style: FontManager.headerSubtitleText(),
                          ),
                          AppSpacing.h4,

                          // Location
                          Text(
                            AppStrings.jobLocationJakarta,
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
                Text(AppStrings.detailsJobDescription),

                // Job Details Container
                AppSpacing.h12,
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade300),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Experience
                      _buildDetailItem(
                        title: AppStrings.experienceLabel,
                        value: "2-3 Years",
                      ),

                      // Vertical divider
                      Container(
                        width: 1.w,
                        height: 40.h,
                        color: Colors.grey.shade300,
                      ),

                      // Job Type
                      _buildDetailItem(title: "Job Type", value: "Full-time"),

                      // Vertical divider
                      Container(
                        width: 1.w,
                        height: 40.h,
                        color: Colors.grey.shade300,
                      ),

                      // Level
                      _buildDetailItem(title: "Level", value: "Entry level"),
                    ],
                  ),
                ),
                AppSpacing.h18,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.requirementsTitle,
                      style: FontManager.headlineText(),
                    ),
                    AppSpacing.h10,
                    Text(
                      AppStrings.requirementEnglish,
                      style: FontManager.subtitleText(
                        color: AppColors.black,
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem({required String title, required String value}) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 8.h),
          Text(title, style: FontManager.headerSubtitleText()),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
