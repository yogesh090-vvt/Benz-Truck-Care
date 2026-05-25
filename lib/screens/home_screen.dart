import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void callNumber() async {
    final Uri phoneUri = Uri.parse('tel:1800123456');

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Benz Truck Care'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: [
            dashboardCard(
              title: 'Branches',
              icon: Icons.location_city,
              onTap: () {},
            ),
            dashboardCard(
              title: 'Jobs',
              icon: Icons.work,
              onTap: () {},
            ),
            dashboardCard(
              title: 'Toll Free',
              icon: Icons.call,
              onTap: callNumber,
            ),
            dashboardCard(
              title: 'Nearby',
              icon: Icons.map,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboardCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red.shade700,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
