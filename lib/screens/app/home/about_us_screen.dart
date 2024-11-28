import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Clinic Image
              Container(
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
              ),

              // Title
              const SizedBox(height: 20),
              const Text(
                'Our Clinic',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Description
              const SizedBox(height: 10),
              const Text(
                'We are a dedicated healthcare facility committed to providing exceptional care to our patients. Our experienced team of professionals is passionate about improving health and well-being.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              // Contact Information
              const SizedBox(height: 20),
              const Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const ListTile(
                leading: Icon(Icons.phone),
                title: Text('+123 456 7890'),
              ),
              const ListTile(
                leading: Icon(Icons.email),
                title: Text('clinic@example.com'),
              ),
              const ListTile(
                leading: Icon(Icons.location_on),
                title: Text('123 Main Street, Anytown, CA 12345'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
