import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myclinic/common/loaders/full_screen_loader.dart';
import 'package:myclinic/data/app/make_review.dart';
import 'package:myclinic/data/auth/user.dart';
import 'package:myclinic/models/appointment_model.dart';
import 'package:myclinic/utils/constants/colors.dart';

class MakeReviewSceen extends StatefulWidget {
  const MakeReviewSceen({super.key, this.app});
  final AppointmentModel? app;

  @override
  State<MakeReviewSceen> createState() => _MakeReviewSceenState();
}

class _MakeReviewSceenState extends State<MakeReviewSceen> {
  final TextEditingController _comment = TextEditingController();

  final TextEditingController _rating = TextEditingController(text: "1");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rate Doctor",
          style: TextStyle(
              fontSize: 18,
              color: Color(0xff2A456A),
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Your opinion matter to us!",
                style: TextStyle(color: KColors.bestGrey, fontSize: 16),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          widget.app!.photo ?? ''), // Add an image asset here
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.app!.docotrName ?? '',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.app!.doctorSpecialization ?? '',
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Center(
                child: Text(_rating.text,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: KColors.black)),
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: RatingBar.builder(
                  initialRating: 1,
                  minRating: 1,
                  maxRating: 5,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    _rating.text = rating.toInt().toString();
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Comment",
                style: TextStyle(fontSize: 16, color: KColors.black),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: _comment,
                maxLines: 4,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      MakeReviewService service = MakeReviewService();
                      KFullScreenLoader.openLoadingDialog(
                        context,
                        text: "Adding Your Review",
                      );
                      await service.makeReview(
                          docotrID: widget.app!.docotrId!,
                          userName: User().getUser()!.name!,
                          rating: int.parse(_rating.text),
                          comment: _comment.text);
                      if (context.mounted) {
                        KFullScreenLoader.stopLoading(context);
                        Navigator.of(context).pop();
                      }
                    } catch (e) {
                      if (context.mounted) {
                        KFullScreenLoader.stopLoading(context);
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  child: const Text("Submit"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
