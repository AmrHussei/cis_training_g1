import 'package:cached_network_image/cached_network_image.dart';
import 'package:cis_training_g1/core/utils/app_colors.dart';
import 'package:cis_training_g1/core/utils/app_styles.dart';
import 'package:cis_training_g1/features/home/data/models/all_home_data_model.dart';
import 'package:flutter/material.dart';

class PersonCardWidget extends StatelessWidget {
  final Person person;

  const PersonCardWidget({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            _buildProfileImage(context),
            const SizedBox(width: 12),
            Expanded(
              child: _buildPersonInfo(context),
            ),
            _buildPopularityIndicator(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
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
                placeholder: (context, url) => _buildPlaceholderImage(context),
                errorWidget: (context, url, error) =>
                    _buildPlaceholderImage(context),
              ),
            )
          : _buildPlaceholderImage(context),
    );
  }

  Widget _buildPlaceholderImage(BuildContext context) {
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

  Widget _buildPersonInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          person.name ?? 'No Name',
          style: AppStyles.styleBold16(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          person.knownForDepartment ?? 'No Department',
          style: AppStyles.styleMedium12(context).copyWith(
            color: AppColors.primary(context),
          ),
        ),
        const SizedBox(height: 8),
        if (person.knownFor.isNotEmpty) ...[
          Text(
            'Known For:',
            style: AppStyles.styleMedium12(context).copyWith(
              color: AppColors.typographySubTitle(context),
            ),
          ),
          const SizedBox(height: 4),
          _buildKnownForList(context),
        ],
      ],
    );
  }

  Widget _buildKnownForList(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: person.knownFor.take(3).map((work) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: AppColors.lightGreen(context),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            work.title ?? 'No Title',
            style: AppStyles.styleMedium12(context).copyWith(
              color: AppColors.primary(context),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPopularityIndicator(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary(context).withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.trending_up,
                size: 12,
                color: AppColors.primary(context),
              ),
              const SizedBox(width: 4),
              Text(
                person.popularity.toStringAsFixed(1),
                style: AppStyles.styleMedium12(context).copyWith(
                  color: AppColors.primary(context),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: AppColors.iconsTertiary(context),
            size: 20,
          ),
        ),
      ],
    );
  }
}
