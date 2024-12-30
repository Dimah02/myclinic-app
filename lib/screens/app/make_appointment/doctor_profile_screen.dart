import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myclinic/data/app/get_doctor.dart';
import 'package:myclinic/models/doctor_model.dart';
import 'package:myclinic/screens/app/make_appointment/make_appintment_screen.dart';
import 'package:myclinic/screens/app/make_appointment/make_review_sceen.dart';
import 'package:myclinic/screens/app/make_appointment/view_reviews_sceen.dart';
import 'package:myclinic/screens/app/make_appointment/widgets/service_card.dart';
import 'package:myclinic/utils/constants/colors.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({super.key, this.id});
  final String? id;

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Docotr Profile"),
      ),
      body: FutureBuilder(
          future: GetDoctorService().getDoctor(id: widget.id!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DoctorProfile(
                d: snapshot.data!,
                name: snapshot.data!.name!,
                specialization: snapshot.data!.specialization!,
                about: snapshot.data!.about!,
                photo: snapshot.data!.photo!,
                action: () {
                  setState(() {});
                },
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

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({
    super.key,
    required this.name,
    required this.specialization,
    required this.about,
    required this.photo,
    required this.d,
    required this.action,
  });
  final String name, specialization, about, photo;
  final DoctorModel d;
  final Null Function() action;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
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
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Specialist on $specialization',
                              style: const TextStyle(
                                fontSize: 14,
                                color: KColors.bestGrey,
                              ),
                            ),
                          ),
                        ],
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
                      title: '${Random().nextInt(11) + 1}+', subtitle: 'Years'),
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
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Doctor Rating",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: KColors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return ViewReviewsSceen(
                          reviewList: d.reviews ?? [],
                        );
                      },
                    ));
                  },
                  child: const Text(
                    "View Reviews",
                    style: TextStyle(
                      fontSize: 12,
                      color: KColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "(${d.reviews!.length}) ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: KColors.black,
                  ),
                ),
                const Text(
                  "total reviews",
                  style: TextStyle(color: KColors.bestGrey),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: RatingBar.builder(
                initialRating: d.averageRating,
                ignoreGestures: true,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Text(
                "${d.averageRating}",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: KColors.black),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return MakeReviewSceen(
                        d: d,
                        action: action,
                      );
                    },
                  ));
                },
                child: const Text("Make A Review"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
