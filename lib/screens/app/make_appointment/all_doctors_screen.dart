import 'package:flutter/material.dart';
import 'package:myclinic/data/app/get_category.dart';
import 'package:myclinic/screens/app/make_appointment/doctors_screen.dart';
import 'package:myclinic/utils/constants/colors.dart';

class AllDoctorsScreen extends StatelessWidget {
  const AllDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: CategoryService().getDoctors(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DoctorsScreen(
                docotrs: snapshot.data!,
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
