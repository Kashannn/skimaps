import 'package:flutter/material.dart';
import 'package:skimaps/views/styles.dart';

class TermsAndUsage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Usage'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'By using the Skiing Adventure app ("App"), you agree to the following terms and conditions:',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '1. License and Access',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            ListTile(
              leading: Container(
                height: 10.0,
                width: 10,
                decoration: const BoxDecoration(
                  color: Styles.mainColor,
                  shape: BoxShape.circle,
                ),
              ),
              title: const Text(
                'You are granted a limited, non-exclusive, and non-transferable license to use the App for your personal, non-commercial use.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '2. User Conduct',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            ListTile(
              leading: Container(
                height: 10.0,
                width: 10,
                decoration: const BoxDecoration(
                  color: Styles.mainColor,
                  shape: BoxShape.circle,
                ),
              ),
              title: const Text(
                'You agree to use the App only for lawful purposes and in a manner that does not violate any applicable laws, regulations, or third-party rights.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 8.0),
            ListTile(
              leading: Container(
                height: 10.0,
                width: 10,
                decoration: const BoxDecoration(
                  color: Styles.mainColor,
                  shape: BoxShape.circle,
                ),
              ),
              title: const Text(
                'You agree not to use the App to transmit or store any content that is infringing, defamatory, obscene, fraudulent, or otherwise objectionable.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '3. Intellectual Property',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            ListTile(
              leading: Container(
                height: 10.0,
                width: 10,
                decoration: const BoxDecoration(
                  color: Styles.mainColor,
                  shape: BoxShape.circle,
                ),
              ),
              title: const Text(
                'The App and its content, including but not limited to text, graphics, images, logos, and software, are protected by intellectual property laws and belong to Skiing Adventure or its licensors.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 16.0),
            // Add other sections of the terms and usage as needed
          ],
        ),
      ),
    );
  }
}
