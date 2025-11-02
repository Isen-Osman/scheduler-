import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String timeUntilExam() {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);
    final days = diff.inDays;
    final hours = diff.inHours % 24;
    return exam.isPassed
        ? "Испитот е завршен"
        : "$days дена и $hours часа до испитот";
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');

    final Color statusColor = exam.isPassed ? Colors.green.shade600 : Colors.orange.shade600;
    final IconData statusIcon = exam.isPassed ? Icons.check_circle : Icons.schedule;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black12, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              expandedHeight: 180,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  exam.subject,
                  style: const TextStyle(color: Colors.white),
                ),
                background: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: statusColor,
                      child: Icon(statusIcon, color: Colors.white, size: 40),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        timeUntilExam(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildDetailCard(
                        icon: Icons.book_outlined,
                        title: "Предмет",
                        value: exam.subject,
                        color: Colors.white70),
                    _buildDetailCard(
                        icon: Icons.calendar_today_outlined,
                        title: "Датум",
                        value: dateFormat.format(exam.dateTime),
                        color: Colors.white70),
                    _buildDetailCard(
                        icon: Icons.access_time_outlined,
                        title: "Време",
                        value: timeFormat.format(exam.dateTime),
                        color: Colors.white70),
                    _buildDetailCard(
                        icon: Icons.room_outlined,
                        title: "Простории",
                        value: exam.rooms.join(", "),
                        color: Colors.white70),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard(
      {required IconData icon,
        required String title,
        required String value,
        required Color color}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white30),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white24,
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: color, fontSize: 14)),
              const SizedBox(height: 4),
              Text(value,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
