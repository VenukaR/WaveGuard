import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String dateRange;
  final String description;
  final double progress;
  final String currentValue;
  final String targetValue;
  final String rewardAmount;
  final String rewardType;
  final Color progressColor;
  
  const TaskCard({
    super.key,
    required this.title,
    required this.dateRange,
    required this.description,
    required this.progress,
    required this.currentValue,
    required this.targetValue,
    required this.rewardAmount,
    required this.rewardType,
    this.progressColor = const Color(0xFF7ED957), // Default green color from the image
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  dateRange,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 24),
                Row(children: [
                    Text(
                    'Reward',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[800],
                    ),
                    ),
                    Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                      color: progressColor,
                      width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      Text(
                        '$rewardAmount $rewardType',
                        style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: progressColor,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.delete_outline,
                        size: 14,
                        color: progressColor,
                      ),
                      ],
                    ),
                    ),
                ],)

              ],
            ),
          ),
          const SizedBox(width: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: progressColor.withOpacity(0.2),
                    width: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 130,
                width: 130,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 15,
                  backgroundColor: Colors.transparent,
                  color: progressColor,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${(progress * 100).toInt()}%',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: progressColor,
                    ),
                  ),
                  Text(
                    '$currentValue / $targetValue',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
