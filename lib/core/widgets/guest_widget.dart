// import 'package:cis_training_g1/config/routes/app_routes.dart';
// import 'package:cis_training_g1/core/utils/app_colors.dart';
// import 'package:cis_training_g1/core/utils/app_images.dart';
// import 'package:cis_training_g1/core/utils/app_styles.dart';
// import 'package:cis_training_g1/core/utils/media_query_values.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class GuestWidget extends StatelessWidget {
//   const GuestWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SvgPicture.asset(Assets.imagesAppauthlogo),
//             SizedBox(height: 48),
//             Text(
//               'سجل دخول أولاً للإستمرار',
//               style: AppStyles.styleBold20(context).copyWith(
//                 color: AppColors.typographyHeading(context),
//               ),
//             ),
//             SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: () {
//                 context.navigateTo(Routes.login);
//               },
//               child: Text(
//                 'تسجيل الدخول',
//                 style: AppStyles.styleBold18(context).copyWith(
//                   color: AppColors.white(context),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
