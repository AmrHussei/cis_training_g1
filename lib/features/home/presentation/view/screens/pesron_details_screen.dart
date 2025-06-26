import 'package:cis_training_g1/core/utils/app_colors.dart';
import 'package:cis_training_g1/core/utils/enums.dart';
import 'package:cis_training_g1/core/widgets/error_app_widget.dart';
import 'package:cis_training_g1/core/widgets/loading_app_widget.dart';
import 'package:cis_training_g1/features/home/presentation/view/widgets/person_details/person_details_content_widget.dart';
import 'package:cis_training_g1/features/home/presentation/view/widgets/person_details/person_details_header_widget.dart';
import 'package:cis_training_g1/features/home/presentation/view/widgets/person_details/person_images_widget.dart';
import 'package:cis_training_g1/features/home/presentation/view_model/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PesronDetailsScreen extends StatefulWidget {
  const PesronDetailsScreen({
    super.key,
  });

  @override
  State<PesronDetailsScreen> createState() => _PesronDetailsScreenState();
}

class _PesronDetailsScreenState extends State<PesronDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadPersonData();
    });
  }

  void _loadPersonData() {
    final cubit = context.read<HomeCubit>();
    cubit.personId = cubit.person?.id ?? 0;
    cubit.getPersonInfoById();
    cubit.getPersonImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary(context),
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            switch (state.getPersonInfoByIdRequestState) {
              case RequestState.ideal:
              case RequestState.loading:
                return const LoadingAppWidget();

              case RequestState.loaded:
                return _buildLoadedState(context, state);

              case RequestState.error:
                return ErrorAppWidget(
                  text: state.getPersonInfoByIdError?.message ??
                      'An unexpected error occurred',
                  onTap: () {
                    context.read<HomeCubit>().getPersonInfoById();
                    context.read<HomeCubit>().getPersonImages();
                  },
                );
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoadedState(BuildContext context, HomeState state) {
    final personDetails = state.getPersonInfoByIdModel;
    final personImages = state.getPersonImageModel;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          backgroundColor: AppColors.primary(context),
          flexibleSpace: FlexibleSpaceBar(
            background: PersonDetailsHeaderWidget(
              personDetails: personDetails,
              personData: context.read<HomeCubit>().person,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.white(context),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        SliverToBoxAdapter(
          child: PersonDetailsContentWidget(
            personDetails: personDetails,
            personData: context.read<HomeCubit>().person,
          ),
        ),
        SliverToBoxAdapter(
          child: PersonImagesWidget(
            personImages: personImages,
          ),
        ),
      ],
    );
  }
}
