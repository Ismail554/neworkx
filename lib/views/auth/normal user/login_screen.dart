import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:neworkx/core/app_spacing.dart';
import 'package:neworkx/core/app_strings.dart';
import 'package:neworkx/core/app_colors.dart';
import 'package:neworkx/core/app_padding.dart';
import 'package:neworkx/core/font_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neworkx/views/HomePage/homepage.dart';
import 'package:neworkx/views/auth/normal%20user/forgot_pass.dart';
import 'package:neworkx/views/auth/normal%20user/normarl_sign_up.dart';
import 'package:neworkx/views/auth/normal%20user/sign_up.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
                AppSpacing.h40,

                // Login Card
                Container(
                  width: double.infinity.w,
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: Offset(0, 4),
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
                        LabeledField(
                          hintText: "Phone or Email",
                          controller: _emailPhoneController,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icon(Icons.mail_outline),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter phone or email';
                            }
                            return null;
                          },
                        ),
                        AppSpacing.h12,

                        // Password
                        LabeledField(
                          hintText: "Password",
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          prefixIcon: Icon(Icons.lock_outline),
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
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPassScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                AppStrings.forgotPassword,
                                style: FontManager.headerSubtitleText(),
                              ),
                            ),
                          ),
                        ),

                        // Login button
                        CustomPrimaryButton(
                          text: 'Login ',
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePageScreen(),
                              ),
                            );
                          },
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
                CustomOutlinedButton(
                  label: AppStrings.continueWithGoogle,
                  onPressed: () {},
                ),
                AppSpacing.h12,
                CustomOutlinedButton(
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
                        TextSpan(text: "Don't have an account? "),
                        TextSpan(
                          text: 'Sign UP',
                          style: FontManager.bodyText().copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NormalSignUp(),
                                ),
                              );
                            },
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

class CustomPrimaryButton extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  final String text;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomPrimaryButton({
    super.key,
    this.formKey,
    required this.text,
    this.backgroundColor,
    this.textStyle,
    this.prefixIcon,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity.w,
      height: 48.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: AppPadding.c12),
        ),
        onPressed: () {
          if (formKey == null || (formKey!.currentState?.validate() ?? false)) {
            onPressed?.call();
          }
        },
        child: isLoading
            ? SizedBox(
                width: 24.w,
                height: 24.w,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null) ...[prefixIcon!, AppSpacing.w8],
                  Text(text, style: textStyle ?? FontManager.whiteButtonText()),
                ],
              ),
      ),
    );
  }
}

// class LabeledField extends StatelessWidget {
//   final String hintText;
//   final TextEditingController controller;
//   final TextInputType keyboardType;
//   final IconData? prefixIcon;
//   final Widget? suffixIcon;
//   final String? Function(String?)? validator;
//   final bool obscureText;

//   const LabeledField({
//     required this.hintText,
//     required this.controller,
//     required this.keyboardType,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.validator,
//     this.obscureText = false,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 48.h,
//       child: TextFormField(
//         controller: controller,
//         keyboardType: keyboardType,
//         obscureText: obscureText,
//         validator: validator,
//         decoration: InputDecoration(
//           hintText: hintText,
//           prefixIcon: prefixIcon == null
//               ? null
//               : Icon(prefixIcon, color: AppColors.grey4B),
//           suffixIcon: suffixIcon,
//           contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: AppPadding.c8,
//             borderSide: const BorderSide(color: AppColors.greyD4),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: AppPadding.c8,
//             borderSide: const BorderSide(color: AppColors.primaryColor),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderRadius: AppPadding.c8,
//             borderSide: const BorderSide(color: AppColors.red),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderRadius: AppPadding.c8,
//             borderSide: const BorderSide(color: AppColors.red),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomOutlinedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomOutlinedButton({
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
          side: BorderSide(color: AppColors.greyD4),
          shape: RoundedRectangleBorder(borderRadius: AppPadding.c12),
        ),
        onPressed: onPressed,
        child: Text(label, style: FontManager.buttonText()),
      ),
    );
  }
}

class LabeledField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;

  const LabeledField({
    required this.hintText,
    this.controller,
    required this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.obscureText = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppPadding.c8,
            borderSide: BorderSide(color: AppColors.greyD4),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppPadding.c8,
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: AppPadding.c8,
            borderSide: BorderSide(color: AppColors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: AppPadding.c8,
            borderSide: BorderSide(color: AppColors.red),
          ),
        ),
      ),
    );
  }
}
