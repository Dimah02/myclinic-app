import 'package:flutter/material.dart';
import 'package:myclinic/models/appointment_model.dart';
import 'package:myclinic/screens/app/home/appointment_details.dart';
import 'package:myclinic/utils/constants/colors.dart';

class AppointmentCard extends StatefulWidget {
  final String doctorName;
  final String doctorTitle;
  final String doctorImage;
  final DateTime appointmentDate;
  final String appointmentTime;
  final String appointmentStatus;
  final AppointmentModel app;

  const AppointmentCard({
    super.key,
    required this.app,
    required this.doctorName,
    required this.doctorTitle,
    required this.doctorImage,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.appointmentStatus,
  });

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(widget
                          .doctorImage), // Use cached_network_image if needed
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 220,
                          child: Text(
                            widget.doctorName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(widget.doctorTitle),
                      ],
                    ),
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
                      '${widget.appointmentDate.day}/${widget.appointmentDate.month}',
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
                      widget.appointmentTime,
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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return AppointmentDetails(
                        app: widget.app,
                      );
                    },
                  ));
                }, // Implement button functionality
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff63B4FF).withOpacity(0.1),
                    side: BorderSide(
                        color: const Color(0xff63B4FF).withOpacity(0.1))),
                child: const Text(
                  "Details",
                  style: TextStyle(
                    color: KColors.primary,
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
