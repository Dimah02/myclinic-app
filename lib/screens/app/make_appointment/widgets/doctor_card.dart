import 'package:flutter/material.dart';
import 'package:myclinic/screens/app/make_appointment/doctor_profile_screen.dart';
import 'package:myclinic/utils/constants/colors.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final double reviews;
  final String openingTime;
  final String imagePath;
  final String id;

  const DoctorCard({
    super.key,
    required this.id,
    required this.name,
    required this.specialty,
    required this.reviews,
    required this.openingTime,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return DoctorProfileScreen(
                id: id,
              );
            },
          ));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Colors.white,
            border: Border.all(
              color: KColors.bestGrey.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: KColors.bestGrey.withOpacity(0.15),
                    backgroundImage: NetworkImage(imagePath),
                    onBackgroundImageError: (exception, stackTrace) =>
                        const SizedBox(),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: KColors.black),
                        ),
                        Text(
                          specialty,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: KColors.bestGrey,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Divider(
                color: KColors.bestGrey.withOpacity(0.5),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xffFEB052),
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${reviews.toStringAsFixed(1)} Reviews",
                        style: const TextStyle(
                          color: Color(0xffFEB052),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: KColors.primary,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Open at $openingTime AM",
                        style: const TextStyle(
                            fontSize: 12, color: KColors.primary),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
