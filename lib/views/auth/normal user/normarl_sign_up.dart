import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neworkx/core/app_spacing.dart';
import 'package:neworkx/core/app_strings.dart';
import 'package:neworkx/core/font_manager.dart';
import 'package:neworkx/views/auth/normal%20user/login_screen.dart';
import 'package:neworkx/views/auth/normal%20user/verify_screen.dart';

class NormalSignUp extends StatefulWidget {
  const NormalSignUp({super.key});

  @override
  State<NormalSignUp> createState() => _NormalSignUpState();
}

class _NormalSignUpState extends State<NormalSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            children: [
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_outlined, color: Colors.black),
                ),
              ),
              Text(
                AppStrings.signUpTitle,
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
              ),
              Text(AppStrings.subSignUpTitle),
              AppSpacing.h16,
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 2,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    LabeledField(
                      hintText: "Full Name",
                      keyboardType: TextInputType.name,
                      prefixIcon: Icon(Icons.person_4_outlined),
                    ),
                    AppSpacing.h6,
                    LabeledField(
                      hintText: "Email",
                      keyboardType: TextInputType.name,
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    AppSpacing.h6,
                    LabeledField(
                      hintText: "Phone",
                      keyboardType: TextInputType.name,
                      prefixIcon: Icon(Icons.local_phone_sharp),
                    ),
                    AppSpacing.h6,
                    LabeledField(
                      hintText: "Password",
                      keyboardType: TextInputType.name,
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                    ),
                    AppSpacing.h6,
                    LabeledField(
                      hintText: "Confirm Password",
                      keyboardType: TextInputType.name,
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                    ),
                    AppSpacing.h6,
                  ],
                ),
              ),
              AppSpacing.h32,
              CustomPrimaryButton(
                text: AppStrings.createAccountButton,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VerifyScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
