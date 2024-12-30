import 'package:flutter/material.dart';
import 'package:myclinic/utils/constants/colors.dart';

class HistoryAppointmentCard extends StatelessWidget {
  final String doctorName;
  final String doctorTitle;
  final String doctorImage;
  final DateTime appointmentDate;
  final String appointmentTime;
  final String appointmentStatus;

  const HistoryAppointmentCard({
    super.key,
    required this.doctorName,
    required this.doctorTitle,
    required this.doctorImage,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.appointmentStatus,
  });

  @override
  Widget build(BuildContext context) {
    bool red = appointmentStatus.toLowerCase() == "cancelled" ? true : false;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: KColors.bestGrey.withOpacity(0.1))),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      doctorImage), // Use cached_network_image if needed
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(doctorTitle),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Divider(
              color: KColors.bestGrey.withOpacity(0.2),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: 18,
                      color: KColors.bestGrey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${appointmentDate.day}/${appointmentDate.month}',
                      style: const TextStyle(
                          fontSize: 14, color: KColors.bestGrey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        size: 18, color: KColors.bestGrey),
                    const SizedBox(width: 8),
                    Text(
                      appointmentTime,
                      style: const TextStyle(
                          fontSize: 14, color: KColors.bestGrey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {}, // Implement button functionality
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        !red ? KColors.accent : Colors.red.shade100,
                    side: BorderSide(
                        color: !red ? KColors.accent : Colors.red.shade100)),
                child: Text(
                  appointmentStatus.toUpperCase(),
                  style: TextStyle(
                    color: red ? Colors.red.shade800 : KColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
