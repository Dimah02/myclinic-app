import 'package:flutter/material.dart';
import 'package:myclinic/common/loaders/full_screen_loader.dart';
import 'package:myclinic/data/app/cancel_appointment.dart';
import 'package:myclinic/models/appointment_model.dart';
import 'package:myclinic/utils/constants/colors.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails(
      {super.key, required this.app, required this.action});
  final AppointmentModel app;
  final Null Function() action;

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Doctor Informations",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: KColors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.network(
                      widget.app.photo!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.app.docotrName}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: KColors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Specialist on ${widget.app.doctorSpecialization}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: KColors.bestGrey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Row(
                        children: [
                          Icon(Icons.access_time,
                              size: 16, color: KColors.bestGrey),
                          SizedBox(width: 4),
                          Text(
                            '9:00 AM - 17:00 PM',
                            style: TextStyle(
                              fontSize: 14,
                              color: KColors.bestGrey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              "Appointment Time",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: KColors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                  size: 18,
                  color: KColors.bestGrey,
                ),
                const SizedBox(width: 8),
                const Text(
                  "Date: ",
                  style: TextStyle(fontSize: 16, color: KColors.black),
                ),
                Text(
                  '${widget.app.date!.day}/${widget.app.date!.month}',
                  style: const TextStyle(fontSize: 16, color: KColors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Icon(Icons.access_time,
                    size: 18, color: KColors.bestGrey),
                const SizedBox(width: 8),
                const Text(
                  "Time: ",
                  style: TextStyle(fontSize: 16, color: KColors.black),
                ),
                Text(
                  widget.app.time!,
                  style: const TextStyle(fontSize: 16, color: KColors.black),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                const Text(
                  "Appointment Status: ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: KColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  widget.app.status!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 72,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showAlertDialog(context,
                      doctorName: widget.app.docotrName!,
                      date: widget.app.date.toString().split(" ")[0],
                      time: widget.app.time!,
                      appID: widget.app.id!);
                }, // Implement button functionality
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade700.withOpacity(0.1),
                    side: BorderSide(
                        color: Colors.red.shade700.withOpacity(0.1))),
                child: Text(
                  "Cancel Appointment",
                  style: TextStyle(
                    color: Colors.red.shade600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAlertDialog(
    BuildContext context, {
    required String doctorName,
    required String date,
    required String time,
    required String appID,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            "Are you sure you want to cancel this appointment?",
            style: TextStyle(color: KColors.primary, fontSize: 16),
          ),
          content: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Doctor: $doctorName"),
                const SizedBox(
                  height: 8,
                ),
                Text("Date: $date"),
                const SizedBox(
                  height: 8,
                ),
                Text("Time: $time"),
              ],
            ),
          ),
          actions: <Widget>[
            OutlinedButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Confirm'),
              onPressed: () async {
                // Handle the confirm action
                try {
                  CancelAppointmentService service = CancelAppointmentService();
                  KFullScreenLoader.openLoadingDialog(context,
                      text: "Cancelling Your Appointment");
                  await service.cancelAppointment(appID: appID);
                  if (context.mounted) {
                    widget.action();
                    KFullScreenLoader.stopLoading(context);
                  }
                } catch (e) {
                  if (context.mounted) {
                    widget.action();
                    KFullScreenLoader.stopLoading(context);
                  }
                }
                if (context.mounted) {
                  widget.action();
                  Navigator.of(context)
                    ..pop()
                    ..pop();
                  widget.action();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
