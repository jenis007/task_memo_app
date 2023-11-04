import 'package:flutter/material.dart';

class DataItemWidget extends StatelessWidget {
  final int index;
  final String value;

  const DataItemWidget({super.key, required this.index, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.grey.shade200 : Colors.grey.shade400,
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Text(
            '${index + 1}.',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
