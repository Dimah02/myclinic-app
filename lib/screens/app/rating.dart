import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: PatientFeedbackScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class PatientFeedbackScreen extends StatelessWidget {
  const PatientFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Patients Feedback',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: const Icon(Icons.arrow_back),
      ),
      body: Column(
        children: List.generate(4, (index) => _FeedbackCard()),
      ),
    );
  }
}

class _FeedbackCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[300],
              child: const Text("IMAGE"),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Patient",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: List.generate(
                      5,
                      (_) => const Icon(Icons.star,
                          color: Colors.amber, size: 16)),
                ),
                const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
