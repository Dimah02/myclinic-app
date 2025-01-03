import 'package:flutter/material.dart';
import 'package:myclinic/data/app/get_appointmets.dart';
import 'package:myclinic/screens/app/home/widgets/history_appointment_list.dart';
import 'package:myclinic/utils/constants/colors.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appointments History"),
      ),
      body: FutureBuilder(
          future: Provider.of<GetAppointmentService>(context, listen: false)
              .getHistory(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HistoryAppointmentsList(
                app: snapshot.data,
                header: const [],
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
