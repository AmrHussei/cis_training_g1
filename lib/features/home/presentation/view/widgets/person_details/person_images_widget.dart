import 'package:cached_network_image/cached_network_image.dart';
import 'package:cis_training_g1/core/utils/app_colors.dart';
import 'package:cis_training_g1/core/utils/app_styles.dart';
import 'package:cis_training_g1/core/utils/media_query_values.dart';
import 'package:cis_training_g1/features/home/data/models/person_images_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/routes/app_routes.dart';
import '../../../view_model/home/home_cubit.dart';

class PersonImagesWidget extends StatelessWidget {
  final PersonImagesModel? personImages;

  const PersonImagesWidget({
    super.key,
    this.personImages,
  });

  @override
  Widget build(BuildContext context) {
    if (personImages == null || personImages!.profiles.isEmpty) {
      print('personImages is null');
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Photos',
            style: AppStyles.styleBold20(context),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: personImages!.profiles.length,
              itemBuilder: (context, index) {
                final image = personImages!.profiles[index];
                return _buildImageItem(context, image);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageItem(BuildContext context, ProfileImage image) {
    return GestureDetector(
      onTap: () {
        context.read<HomeCubit>().imagePath =
            'https://image.tmdb.org/t/p/w500${image.filePath}';
        context.navigateTo(Routes.showPersonImage);
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow(context).withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: 'https://image.tmdb.org/t/p/w500${image.filePath}',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                placeholder: (context, url) => Container(
                  color: AppColors.backgroundGrey(context),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: AppColors.backgroundGrey(context),
                  child: Icon(
                    Icons.error,
                    color: AppColors.typographySubTitle(context),
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.primary(context).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star,
                        size: 12,
                        color: AppColors.white(context),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        image.voteAverage.toStringAsFixed(1),
                        style: AppStyles.styleMedium12(context).copyWith(
                          color: AppColors.white(context),
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
    );
  }
}
