import 'package:flutter/material.dart';
import 'package:neworkx/core/app_spacing.dart';
import 'package:neworkx/core/app_strings.dart';
import 'package:neworkx/core/app_colors.dart';
import 'package:neworkx/core/app_padding.dart';
import 'package:neworkx/core/font_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppSpacing.h18,
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Titles
                        Center(
                          child: Column(
                            children: [
                              Text(
                                AppStrings.welcomeText,
                                style: FontManager.titleText(),
                              ),
                              AppSpacing.h8,
                              Text(
                                AppStrings.signIn,
                                style: FontManager.subtitleText(),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        AppSpacing.h20,

                        // Email / Phone
                        _LabeledField(
                          hintText: "Phone or Email",
                          controller: _emailPhoneController,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icons.mail_outline,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter phone or email';
                            }
                            return null;
                          },
                        ),
                        AppSpacing.h12,

                        // Password
                        _LabeledField(
                          hintText: "Password",
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          prefixIcon: Icons.lock_outline,
                          obscureText: _obscurePassword,
                          suffixIcon: IconButton(
                            onPressed: () => setState(() {
                              _obscurePassword = !_obscurePassword;
                            }),
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppColors.grey4B,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),

                        // Forgot password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              AppStrings.forgotPassword,
                              style: FontManager.headerSubtitleText(),
                            ),
                          ),
                        ),

                        // Login button
                        SizedBox(
                          width: double.infinity,
                          height: 48.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: AppPadding.c12,
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                // TODO: Handle login
                              }
                            },
                            child: Text(
                              AppStrings.loginButton,
                              style: FontManager.whiteButtonText(),
                            ),
                          ),
                        ),
                        AppSpacing.h20,
                      ],
                    ),
                  ),
                ),
                // OR divider
                AppSpacing.h12,
                Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.greyD9)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Or', style: FontManager.bodyText()),
                    ),
                    Expanded(child: Divider(color: AppColors.greyD9)),
                  ],
                ),
                AppSpacing.h20,

                // Social buttons
                _OutlinedButton(
                  label: AppStrings.continueWithGoogle,
                  onPressed: () {},
                ),
                AppSpacing.h12,
                _OutlinedButton(
                  label: AppStrings.continueWithApple,
                  onPressed: () {},
                ),

                AppSpacing.h20,

                // Sign up prompt
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: FontManager.bodyText(),
                      children: [
                        const TextSpan(text: "Don't have an account? "),
                        TextSpan(
                          text: 'Sign UP',
                          style: FontManager.bodyText().copyWith(
                            fontWeight: FontWeight.w700,
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

class _LabeledField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;

  const _LabeledField({
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.obscureText = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon == null
              ? null
              : Icon(prefixIcon, color: AppColors.grey4B),
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppPadding.c8,
            borderSide: const BorderSide(color: AppColors.greyD4),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppPadding.c8,
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: AppPadding.c8,
            borderSide: const BorderSide(color: AppColors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: AppPadding.c8,
            borderSide: const BorderSide(color: AppColors.red),
          ),
        ),
      ),
    );
  }
}

class _OutlinedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _OutlinedButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.black,
          side: const BorderSide(color: AppColors.greyD4),
          shape: RoundedRectangleBorder(borderRadius: AppPadding.c12),
        ),
        onPressed: onPressed,
        child: Text(label, style: FontManager.buttonText()),
      ),
    );
  }
}
