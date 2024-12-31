import 'package:flutter/material.dart';

class DiabetesPage extends StatelessWidget {
  const DiabetesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Diabetes Management"),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                "https://thumbs.dreamstime.com/b/red-heart-shape-medical-stethoscope-light-background-top-view-health-care-medicare-cardiology-concept-blue-104679825.jpg",
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Diabetes Management: Tips for a Healthier Life",
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Managing diabetes effectively is crucial for maintaining overall health and preventing complications.",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16.0),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Key Tips:\n",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        "• Maintain a balanced diet\n• Monitor blood sugar levels\n• Exercise regularly",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Diabetes is a chronic condition that affects millions of people around the world. It occurs when the body is unable to properly regulate blood sugar levels, leading to high blood sugar. Over time, uncontrolled diabetes can cause serious complications such as heart disease, kidney damage, nerve problems, and vision loss. However, with proper management, individuals with diabetes can lead healthy and fulfilling lives. Effective diabetes management revolves around controlling blood sugar levels. Maintaining a stable blood sugar range helps prevent complications and promotes overall well-being. The following tips can aid in managing diabetes and improving quality of life.  Managing diabetes can be challenging, but having a support system can make it easier. Surrounding oneself with family, friends, or support groups who understand the condition can provide emotional encouragement and practical advice. Healthcare providers can also offer guidance and resources to help individuals stay on track.   In conclusion, managing diabetes requires a multifaceted approach that includes regular blood sugar monitoring, a balanced diet, regular physical activity, and medication adherence. By adopting healthy lifestyle habits and staying proactive about their health, individuals with diabetes can lead healthier lives and reduce the risk of complications. With the right tools and support, diabetes management becomes an achievable goal for a better quality of life.",
              style: TextStyle(
                fontSize: 18.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
