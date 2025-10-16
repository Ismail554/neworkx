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

// class ElevatedButtonCustom extends StatelessWidget {
//   final GlobalKey<FormState>? formKey;
//   final String? text;
//   final String? iconPath;
//   final TextStyle? textStyle;
//   final Color? backgroundColor;
//   final VoidCallback? onPressed;

//   const ElevatedButtonCustom({
//     super.key,
//     this.formKey,
//     required this.text,
//     this.iconPath,
//     required this.backgroundColor,
//     this.onPressed,
//     this.textStyle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: SizedBox(
//         width: double.infinity.w,
//         height: 48.h,
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: backgroundColor ?? AppColors.primaryColor,
//             foregroundColor: Colors.white,
//             shape: RoundedRectangleBorder(borderRadius: AppPadding.c12),
//           ),
//           onPressed: () {
//             if (formKey == null ||
//                 (formKey!.currentState?.validate() ?? false)) {
//               onPressed?.call();
//             }
//           },
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               if (iconPath != null) ...[
//                 Image.asset(iconPath!, height: 20.h, width: 20.w),
//                 SizedBox(width: 8.w),
//               ],
//               Text(
//                 text ?? AppStrings.agencyReferred,
//                 style: FontManager.whiteButtonText(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
