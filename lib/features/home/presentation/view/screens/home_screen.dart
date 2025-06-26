import 'package:cis_training_g1/core/utils/app_colors.dart';
import 'package:cis_training_g1/core/utils/enums.dart';
import 'package:cis_training_g1/core/widgets/error_app_widget.dart';
import 'package:cis_training_g1/core/widgets/loading_app_widget.dart';
import 'package:cis_training_g1/features/home/presentation/view/widgets/Home/home_header_widget.dart';
import 'package:cis_training_g1/features/home/presentation/view/widgets/Home/loaded_content_widget.dart';
import 'package:cis_training_g1/features/home/presentation/view_model/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().getAllHomeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary(context),
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeaderWidget(),
            Expanded(
              child: BlocBuilder<HomeCubit, dynamic>(
                builder: (context, state) {
                  return _buildContentBasedOnState(context, state);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentBasedOnState(BuildContext context, dynamic state) {
    switch (state.getAllHomeDataRequestState) {
      case RequestState.loading:
      case RequestState.ideal:
        return const LoadingAppWidget();
      case RequestState.loaded:
        return LoadedContentWidget(
          dataModel: state.getAllHomeDataModel,
          onRefresh: () => _loadInitialData(context),
        );
      case RequestState.error:
        return ErrorAppWidget(
          text: state.getAllHomeDataError?.message ??
              'An unexpected error occurred',
          onTap: () => _loadInitialData(context),
        );
      default:
        return const LoadingAppWidget();
    }
  }

  void _loadInitialData(BuildContext context) {
    context.read<HomeCubit>().getAllHomeData();
  }
}
