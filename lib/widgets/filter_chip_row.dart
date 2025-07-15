import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class FilterChipRow extends StatelessWidget {
  final List<String> filters = ['All', 'Completed', 'Pending'];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: filters.map((filter) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ChoiceChip(
            label: Text(filter),
            selected: provider.filter == filter,
            onSelected: (_) {
              provider.setFilter(filter);
            },
          ),
        );
      }).toList(),
    );
  }
}