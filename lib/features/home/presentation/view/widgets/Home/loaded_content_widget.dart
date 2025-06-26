import 'package:cis_training_g1/core/widgets/empty_widget.dart';
import 'package:cis_training_g1/features/home/data/models/all_home_data_model.dart';
import 'package:cis_training_g1/features/home/presentation/view/widgets/Home/person_card_widget.dart';
import 'package:flutter/material.dart';

class LoadedContentWidget extends StatelessWidget {
  final AllHomeDataModel? dataModel;
  final VoidCallback onRefresh;

  const LoadedContentWidget({
    super.key,
    required this.dataModel,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final persons = dataModel?.results ?? [];

    if (persons.isEmpty) {
      return const EmptyWidget(
        title: 'No data available',
      );
    }

    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
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
}
