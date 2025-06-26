import 'package:cached_network_image/cached_network_image.dart';
import 'package:cis_training_g1/core/utils/app_colors.dart';
import 'package:cis_training_g1/features/home/data/models/all_home_data_model.dart';
import 'package:flutter/material.dart';

class PersonProfileImageWidget extends StatelessWidget {
  final Person person;

  const PersonProfileImageWidget({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.backgroundGrey(context),
      ),
      child: person.profilePath != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/w500${person.profilePath}',
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const PersonPlaceholderImageWidget(),
                errorWidget: (context, url, error) =>
                    const PersonPlaceholderImageWidget(),
              ),
            )
          : const PersonPlaceholderImageWidget(),
    );
  }
}

class PersonPlaceholderImageWidget extends StatelessWidget {
  const PersonPlaceholderImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.backgroundGrey(context),
      ),
      child: Icon(
        Icons.person,
        size: 30,
        color: AppColors.typographySubTitle(context),
      ),
    );
  }
}
