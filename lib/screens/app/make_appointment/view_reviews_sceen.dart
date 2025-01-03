import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myclinic/models/doctor_model.dart';
import 'package:myclinic/screens/app/make_appointment/widgets/comment_box.dart';
import 'package:myclinic/utils/constants/colors.dart';

class ViewReviewsSceen extends StatelessWidget {
  const ViewReviewsSceen(
      {super.key, required this.reviewList, required this.d});
  final List<Review> reviewList;
  final DoctorModel d;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: reviewList.isEmpty ? 1 : reviewList.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  const SizedBox(
                    height: 32,
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
                    height: 32,
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
                  const Divider(),
                  const SizedBox(height: 24),
                ],
              );
            } else {
              index -= 1;
              return Comment(
                name: reviewList[index].userName!,
                comment: reviewList[index].comment!,
                rating: reviewList[index].rating,
              );
            }
          },
        ),
      ),
    );
  }
}
