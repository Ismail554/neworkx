import 'package:flutter/material.dart';
import 'package:neworkx/core/app_spacing.dart';
// import 'package:neworkx/core/app_spacing.dart';
import 'package:neworkx/core/app_strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App Logo
              Image.asset(
                "assets/images/neworkx_logo.png",
                height: 50,
                width: 180,
              ),
              const SizedBox(height: 40),

              // Login Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      AppStrings.welcomeText,
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      AppStrings.signIn,
                      style: GoogleFonts.montserrat(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // AppSpacing.h12,
                    SizedBox(height: 18,),
                     Text(
                      AppStrings.signIn,
                      style: GoogleFonts.montserrat(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
               
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
