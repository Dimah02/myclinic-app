import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myclinic/models/doctor_model.dart';
import 'package:myclinic/utils/constants/colors.dart';

class ViewReviewsSceen extends StatelessWidget {
  const ViewReviewsSceen({super.key, required this.reviewList});
  final List<Review> reviewList;

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
          itemCount: reviewList.length,
          itemBuilder: (context, index) {
            return Comment(
              name: reviewList[index].userName!,
              comment: reviewList[index].comment!,
              rating: reviewList[index].rating,
            );
          },
        ),
      ),
    );
  }
}

class Comment extends StatelessWidget {
  const Comment({
    super.key,
    required this.name,
    required this.comment,
    required this.rating,
  });
  final String name;
  final String comment;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12, top: 12),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn-icons-png.flaticon.com/128/847/847969.png"),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(name.split(" ")[0]),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          rating.toString(),
                          style: const TextStyle(color: KColors.bestGrey),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        RatingBar.builder(
                          itemSize: 16,
                          initialRating: rating.toDouble(),
                          ignoreGestures: true,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      comment,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 104, 104, 104)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
