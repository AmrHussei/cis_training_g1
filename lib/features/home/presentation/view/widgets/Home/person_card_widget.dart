import 'package:cis_training_g1/config/routes/app_routes.dart';
import 'package:cis_training_g1/core/utils/app_colors.dart';
import 'package:cis_training_g1/core/utils/media_query_values.dart';
import 'package:cis_training_g1/features/home/data/models/all_home_data_model.dart';
import 'package:cis_training_g1/features/home/presentation/view/widgets/Home/person_info_widget.dart';
import 'package:cis_training_g1/features/home/presentation/view/widgets/Home/person_popularity_widget.dart';
import 'package:cis_training_g1/features/home/presentation/view/widgets/Home/person_profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/home/home_cubit.dart';

class PersonCardWidget extends StatelessWidget {
  final Person person;

  const PersonCardWidget({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return GestureDetector(
      onTap: () {
        homeCubit.person = null;
        homeCubit.personId = person.id;
        homeCubit.person = person;
        homeCubit.getPersonInfoById();
        homeCubit.getPersonImages();
        context.navigateTo(Routes.personDetailsScreen);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white(context),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow(context).withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PersonProfileImageWidget(person: person),
              const SizedBox(width: 12),
              Expanded(
                child: PersonInfoWidget(person: person),
              ),
              PersonPopularityWidget(person: person),
            ],
          ),
        ),
      ),
    );
  }
}
