import 'package:flutter/material.dart';

class HypertensionPage extends StatelessWidget {
  const HypertensionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Understanding Hypertension"),
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
                "https://cdn.pixabay.com/photo/2016/08/10/20/26/blood-pressure-1584223_1280.jpg",
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Hypertension: The Silent Killer",
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Hypertension, also known as high blood pressure, is a condition that affects millions worldwide.",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16.0),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Symptoms:\n",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        "• Headaches\n• Shortness of breath\n• Nosebleeds (in severe cases)",
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
              "commonly known as high blood pressure, is a condition that affects millions of people worldwide, yet often goes unnoticed. Dubbed (the silent killer), hypertension typically has no obvious symptoms, making it particularly dangerous. Left untreated, it can lead to serious health issues such as heart disease, stroke, kidney damage, and even death.  Blood pressure is the force of blood against the walls of the arteries as the heart pumps it around the body. It is measured in millimeters of mercury (mmHg) and is expressed as two numbers: systolic (the pressure when the heart beats) over diastolic (the pressure when the heart rests between beats). A normal reading is usually around 120/80 mmHg. Hypertension is diagnosed when readings consistently exceed 130/80 mmHg.The causes of hypertension are often multifactorial, including lifestyle factors such as poor diet, lack of exercise, excessive alcohol consumption, and smoking. Genetics and age also play a significant role, with older individuals and those with a family history of hypertension being at higher risk.Despite its lack of symptoms, hypertension can cause long-term damage to blood vessels and organs. Over time, the increased pressure can harden and narrow the arteries, reducing blood flow to vital organs. This damage can result in heart attacks, strokes, kidney disease, and vision loss.               ",
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
