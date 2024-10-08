import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name = "Haris Narrendran";
  final String ldapEmail = "haris@iitb.ac.in";
  final String rollNumber = "23B1857";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Dark background color
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.black, // Dark app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            ProfileField(
              icon: Icons.person,
              label: "Name",
              value: name,
              textColor: Colors.white, // White text for dark mode
              iconColor: Colors.white, // White icon color for dark mode
            ),
            SizedBox(height: 10),
            ProfileField(
              icon: Icons.email,
              label: "LDAP Email",
              value: ldapEmail,
              textColor: Colors.white, // White text
              iconColor: Colors.white, // White icon
            ),
            SizedBox(height: 10),
            ProfileField(
              icon: Icons.account_balance,
              label: "Roll Number",
              value: rollNumber,
              textColor: Colors.white, // White text
              iconColor: Colors.white, // White icon
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color textColor;
  final Color iconColor;

  ProfileField({
    required this.icon,
    required this.label,
    required this.value,
    required this.textColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 30, color: iconColor), // Custom icon color
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: textColor, // Custom text color
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: textColor, // Custom text color
              ),
            ),
          ],
        ),
      ],
    );
  }
}
