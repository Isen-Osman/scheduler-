import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback? onTap;

  const ExamCard({super.key, required this.exam, this.onTap});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');

    final Color statusColor = exam.isPassed ? Colors.green.shade600 : Colors.orange.shade600;
    final String statusText = exam.isPassed ? "Завршено" : "Во чекање";
    final IconData statusIcon = exam.isPassed ? Icons.check_circle : Icons.schedule;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subject + Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    exam.subject,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(statusIcon, size: 16, color: Colors.white),
                      const SizedBox(width: 6),
                      Text(
                        statusText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Date and Time
            Row(
              children: [
                const Icon(Icons.calendar_today_outlined, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text(dateFormat.format(exam.dateTime), style: const TextStyle(fontSize: 14)),
                const SizedBox(width: 16),
                const Icon(Icons.access_time_outlined, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text(timeFormat.format(exam.dateTime), style: const TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 12),

            // Rooms
            Row(
              children: [
                const Icon(Icons.room_outlined, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    exam.rooms.join(", "),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
