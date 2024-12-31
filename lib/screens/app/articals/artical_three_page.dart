import 'package:flutter/material.dart';

class AsthmaPage extends StatelessWidget {
  const AsthmaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Breaking Down Asthma"),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                "https://thumbs.dreamstime.com/b/nutritional-food-heart-health-wellness-cholesterol-diet-healthy-nutrition-eating-clean-fruits-nutritional-food-207935188.jpg",
                width: 500,
                height: 500,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Breaking Down Asthma: Causes and Symptoms",
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Asthma is a chronic condition that affects the airways in the lungs, making breathing difficult.",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16.0),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Common Causes:\n",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        "• Allergens\n• Physical activity\n• Environmental factors",
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
              "Asthma is a chronic respiratory condition that affects the airways in the lungs, making it difficult to breathe. It is characterized by episodes of wheezing, coughing, shortness of breath, and chest tightness. Asthma can range from mild to severe and can impact people of all ages, although it often begins in childhood. Understanding the causes and symptoms of asthma is essential for effective management and treatment. The exact cause of asthma is not fully understood, but it is believed to be a combination of genetic and environmental factors. People with a family history of asthma, allergies, or other respiratory conditions are more likely to develop asthma. In addition, certain environmental triggers can play a significant role in the development and exacerbation of asthma.  Common environmental triggers include allergens such as pollen, dust mites, mold, pet dander, and cockroach droppings. These substances can cause inflammation and narrowing of the airways, leading to asthma symptoms. Air pollution, smoke, and strong odors can also trigger asthma flare-ups. Weather conditions, like cold air or extreme humidity, may aggravate the condition as well. Respiratory infections, such as colds or the flu, can also worsen asthma symptoms, particularly in children. In some cases, physical activities or exercise, especially in cold, dry air, can trigger asthma symptoms. Stress, certain medications, and even strong emotions like laughter or crying may also provoke asthma attacks in some individuals.",
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
