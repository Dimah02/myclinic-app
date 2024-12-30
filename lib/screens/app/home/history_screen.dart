import 'package:flutter/material.dart';
import 'package:myclinic/data/app/get_appointmets.dart';
import 'package:myclinic/screens/app/home/widgets/history_appointment_list.dart';
import 'package:myclinic/utils/constants/colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: GetAppointmentService().getHistory(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HistoryAppointmentsList(
                app: snapshot.data,
                header: const [
                  Padding(
                    padding: EdgeInsets.only(top: 24.0, left: 24, right: 24),
                    child: Text(
                      "Appointments History",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: KColors.black,
                      ),
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: KColors.primary,
                ),
              );
            }
          }),
    );
  }
}
