import 'package:cis_training_g1/core/utils/app_colors.dart';
import 'package:cis_training_g1/core/utils/app_styles.dart';
import 'package:cis_training_g1/core/utils/enums.dart';
import 'package:cis_training_g1/core/widgets/empty_widget.dart';
import 'package:cis_training_g1/core/widgets/error_app_widget.dart';
import 'package:cis_training_g1/core/widgets/loading_app_widget.dart';
import 'package:cis_training_g1/features/home/presentation/view/widgets/home_header_widget.dart';
import 'package:cis_training_g1/features/home/presentation/view/widgets/person_card_widget.dart';
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
    // تحميل البيانات عند بدء الشاشة
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
        return _buildLoadingState();
      case RequestState.loaded:
        return _buildLoadedState(context, state);
      case RequestState.error:
        return _buildErrorState(context, state);
      default:
        return _buildIdealState(context);
    }
  }

  Widget _buildIdealState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home_outlined,
            size: 80,
            color: AppColors.typographySubTitle(context),
          ),
          const SizedBox(height: 16),
          Text(
            'مرحباً بك في التطبيق',
            style: AppStyles.styleBold18(context),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _loadInitialData(context),
            icon: const Icon(Icons.refresh),
            label: const Text('تحديث'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary(context),
              foregroundColor: AppColors.white(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return const LoadingAppWidget();
  }

  Widget _buildLoadedState(BuildContext context, dynamic state) {
    final persons = state.getAllHomeDataModel?.results ?? [];

    if (persons.isEmpty) {
      return const EmptyWidget(
        title: 'No data available',
      );
    }

    return RefreshIndicator(
      onRefresh: () async => _loadInitialData(context),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: persons.length,
        itemBuilder: (context, index) {
          final person = persons[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: PersonCardWidget(person: person),
          );
        },
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, dynamic state) {
    return ErrorAppWidget(
      text:
          state.getAllHomeDataError?.message ?? 'An unexpected error occurred',
      onTap: () => _loadInitialData(context),
    );
  }

  void _loadInitialData(BuildContext context) {
    context.read<HomeCubit>().getAllHomeData();
  }
}
