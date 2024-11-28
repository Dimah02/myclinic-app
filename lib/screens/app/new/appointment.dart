import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: TimeSelectionScreen()));
}

class TimeSelectionScreen extends StatefulWidget {
  const TimeSelectionScreen({super.key});

  @override
  _TimeSelectionScreenState createState() => _TimeSelectionScreenState();
}

class _TimeSelectionScreenState extends State<TimeSelectionScreen> {
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Row(
        children: [
          Icon(Icons.calendar_month),
          Text(
            'Book An Appointment',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Availabe Appointments",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(255, 176, 175, 175)),
            ),
            const SizedBox(
              height: 10,
            ),
            _buildTimeSection("Nov 22", ["9:30 AM", "11:00 AM", "4:00 PM"]),
            const SizedBox(height: 24),
            _buildTimeSection(
                "Nov 24", ["5:00 PM", "6:00 PM", "7:30 PM", "9:00 PM"]),
            const SizedBox(height: 24),
            _buildTimeSection("Nov 26", ["10:00 AM", "12:30 PM", "3:00 PM"]),
            const SizedBox(height: 24),
            _buildTimeSection("Nov 28", ["9:00 AM", "2:00 PM", "6:00 PM"]),
            const SizedBox(height: 24),
            _buildTimeSection("Nov 30", ["8:30 AM", "1:30 PM", "5:30 PM"]),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Showing more available times...')),
                  );
                },
                child: const Text('View More Times'),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(selectedTime == null
                            ? 'No time selected'
                            : 'You selected $selectedTime')),
                  );
                },
                child: const Text('Confirm Booking'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSection(String title, List<String> times) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: times.map((time) {
            final isSelected = time == selectedTime;
            return GestureDetector(
              onTap: () => setState(() => selectedTime = time),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.white,
                  border:
                      Border.all(color: isSelected ? Colors.blue : Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  time,
                  style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
