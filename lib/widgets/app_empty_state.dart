import 'package:flutter/material.dart';

class AppEmptyState extends StatelessWidget {
  final String message;

  const AppEmptyState({
    super.key,
    required this.message,
  });

  const factory AppEmptyState.action({
    Key? key, 
    required String message,
    required String label,
    required Function()? onTap
  }) = _AppEmptyStateWithAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message)
    );
  }
}

class _AppEmptyStateWithAction extends AppEmptyState {
  final String label;
  final Function()? onTap;

  const _AppEmptyStateWithAction({
    super.key,
    required super.message,
    required this.label,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(message),
          ),
          ElevatedButton(
            onPressed: onTap,
            child: Text(label),
          ),
        ],
      ),
    );
  }
}