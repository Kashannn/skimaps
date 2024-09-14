import 'package:flutter/material.dart';
import 'package:skimaps/views/styles.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            const Text(
              'At Skiing Adventure, we are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy explains how we collect, use, and disclose your personal information when you use our skiing app ("App"). By using the App, you agree to the collection and use of your personal information as described in this Privacy Policy.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),

            const SizedBox(height: 8.0),
            const Text(
              'When you use our App, we may collect the following types of information:',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
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
                'Personal Information: We may collect personal information that you provide to us, such as your name, email address, and phone number. This information is collected when you register an account with us, contact us through the App, or otherwise provide it voluntarily.',
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
                'Usage Information: We may collect information about how you use the App, such as your interaction with the App\'s features, the content you view, and the actions you take. This information may be collected through cookies, analytics tools, or other tracking technologies.',
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
                'Device Information: We may collect information about the device you use to access the App, including the type of device, operating system, unique device identifiers, and mobile network information.',
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
                'Location Information: With your consent, we may collect and use your precise location information to provide location-based services within the App, such as tracking your skiing routes or providing weather information.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 16.0),
            // Add other sections of the privacy policy as needed

            // Add spacing or other widgets as needed
          ],
        ),
      ),
    );
  }
}
