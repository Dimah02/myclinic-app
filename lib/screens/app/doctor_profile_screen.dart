import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myclinic/data/app/get_doctor.dart';
import 'package:myclinic/models/doctor_model.dart';
import 'package:myclinic/screens/app/make_appintment_screen.dart';
import 'package:myclinic/utils/constants/colors.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: GetDoctorService().getDoctor(id: id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DoctorProfile(
                  d: snapshot.data!,
                  name: snapshot.data!.name!,
                  specialization: snapshot.data!.specialization!,
                  about: snapshot.data!.about!,
                  photo: snapshot.data!.photo!);
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

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({
    super.key,
    required this.name,
    required this.specialization,
    required this.about,
    required this.photo,
    required this.d,
  });
  final String name, specialization, about, photo;
  final DoctorModel d;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 143, 188, 224),
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.network(
                        photo,
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
                          name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: KColors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Specialist on $specialization',
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

              // Bio Section
              const Text(
                'Bio',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: KColors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                about,
                style: const TextStyle(fontSize: 14, color: KColors.bestGrey),
              ),
              const SizedBox(height: 40),

              // Services Section
              const Text(
                'Services',
                style: TextStyle(
                  color: KColors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ServiceCard(
                        title: '${Random().nextInt(100) + 1}+',
                        subtitle: 'Patients'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: ServiceCard(
                        title: '${Random().nextInt(2) + 1}k+',
                        subtitle: 'Appointments'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ServiceCard(
                        title: '${Random().nextInt(11) + 1}+',
                        subtitle: 'Years'),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return MakeAppintmentScreen(
                            doctor: d,
                            app: d.appointments!,
                          );
                        },
                      ));
                    },
                    child: const Text("Book An Appointment")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const ServiceCard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 4,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: KColors.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: KColors.bestGrey,
            ),
          ),
        ],
      ),
    );
  }
}
