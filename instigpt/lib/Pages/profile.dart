import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name = "Haris Narrendran";
  final String ldapEmail = "haris@iitb.ac.in";
  final String rollNumber = "23B1857";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('lib/assets/profile_icon.png'), // Profile image
          ),
          SizedBox(height: 20),
          ProfileField(
            icon: Icons.person,
            label: "Name",
            value: name,
          ),
          SizedBox(height: 10),
          ProfileField(
            icon: Icons.email,
            label: "LDAP Email",
            value: ldapEmail,
          ),
          SizedBox(height: 10),
          ProfileField(
            icon: Icons.account_balance,
            label: "Roll Number",
            value: rollNumber,
          ),
        ],
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  ProfileField({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 30, color: Theme.of(context).iconTheme.color),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
