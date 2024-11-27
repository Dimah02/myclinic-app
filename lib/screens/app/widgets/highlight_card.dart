import 'package:flutter/material.dart';
import 'package:myclinic/screens/app/about_us_screen.dart';

class HighlightCard extends StatelessWidget {
  const HighlightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 228,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: NetworkImage(
              'https://github.com/dimaphotos/photo/blob/main/clinic.jpg?raw=true'),
          fit: BoxFit.fill,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ' Your Health, Our Priority ',
            style: TextStyle(
              backgroundColor:
                  const Color.fromARGB(255, 5, 67, 105).withOpacity(0.5),
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            ' Caring for You, Every Step of the Way',
            style: TextStyle(
              backgroundColor:
                  const Color.fromARGB(255, 5, 67, 105).withOpacity(0.5),
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return const AboutUsScreen();
                },
              ));
            },
            child: const Text(
              'Learn More',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
