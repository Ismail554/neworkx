import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neworkx/core/app_colors.dart';
import 'package:neworkx/core/app_padding.dart';
import 'package:neworkx/core/app_spacing.dart';
import 'package:neworkx/core/app_strings.dart';
import 'package:neworkx/core/font_manager.dart';
import 'package:neworkx/custom_widgets/elevated_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Sign Up", style: FontManager.titleText()),
              AppSpacing.h10,
              Text(
                AppStrings.chooseSignUpType,
                style: FontManager.subtitleText(),
                textAlign: TextAlign.center,
              ),
              AppSpacing.h40,
              ElevatedButtonCustom(
                formKey: _formKey,
                text: AppStrings.agencyReferred,
                backgroundColor: AppColors.primaryColor,
              ),
              AppSpacing.h12,
              ElevatedButtonCustom(
                formKey: _formKey,
                text: AppStrings.normalUser,
                backgroundColor: AppColors.white,
                textStyle: FontManager.buttonText(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
