import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'exam_details.dart';

class ExamListScreen extends StatelessWidget {
  ExamListScreen({super.key});

  final List<Exam> exams = [
    Exam(subject: "Веб програмирање", dateTime: DateTime(2025, 12, 5, 10, 0), rooms: ["ЛАб 13"]),
    Exam(subject: "Оперативни системи", dateTime: DateTime(2025, 12, 10, 9, 0), rooms: ["ЛАБ 3"]),
    Exam(subject: "Бази на податоци", dateTime: DateTime(2025, 12, 12, 12, 0), rooms: ["ЛАБ 215"]),
    Exam(subject: "Компјутерски Мрежи", dateTime: DateTime(2025, 12, 25, 11, 30), rooms: ["ЛАБ 200А"], isPassed: true),
    Exam(subject: "Вештачка интелигенција", dateTime: DateTime(2025, 12, 1, 8, 30), rooms: ["ЛАБ 138"], isPassed: true),
    Exam(subject: "Интернет технологии", dateTime: DateTime(2025, 12, 15, 13, 0), rooms: ["ЛАБ 13"]),
    Exam(subject: "Мобилни апликации", dateTime: DateTime(2025, 12, 5, 9, 0), rooms: ["ЛАБ 12"]),
    Exam(subject: "Компјутерска графика", dateTime: DateTime(2025, 12, 25, 10, 0), rooms: ["ЛАБ 3"]),
    Exam(subject: "Информациски системи", dateTime: DateTime(2025, 12, 10, 11, 0), rooms: ["ЛАБ 2"]),
    Exam(subject: "Дизајн на интерфејс", dateTime: DateTime(2025, 12, 20, 14, 0), rooms: ["ЛАБ 200Б"], isPassed: true),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.black12],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header + Total Exams
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Column(
                  children: [
                    Text(
                      "Распоред за испити - Исен Осман",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Вкупно испити: ${exams.length}",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              // Exam List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: exams.length,
                  itemBuilder: (context, index) {
                    final exam = exams[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ExamDetailScreen(exam: exam)),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: exam.isPassed
                              ? LinearGradient(colors: [Colors.green.shade400, Colors.green.shade700])
                              : LinearGradient(colors: [Colors.orange.shade400, Colors.orange.shade700]),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              exam.isPassed ? Icons.check_circle : Icons.schedule,
                              color: Colors.white,
                              size: 30,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    exam.subject,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "${exam.dateTime.day.toString().padLeft(2,'0')}.${exam.dateTime.month.toString().padLeft(2,'0')}.${exam.dateTime.year}  -  ${exam.dateTime.hour.toString().padLeft(2,'0')}:${exam.dateTime.minute.toString().padLeft(2,'0')} час",
                                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
