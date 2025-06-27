import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileScreen extends StatelessWidget {
  final User user;

  const UserProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                user.photoURL ??
                    'https://i.pinimg.com/736x/e9/cd/33/e9cd3310df0be9dad8b64c2fa887d690.jpg',
              ),
            ),
            const SizedBox(height: 20),
            _buildProfileItem('Name', user.displayName ?? 'Not provided'),
            _buildProfileItem('Email', user.email ?? 'No email'),
            _buildProfileItem('Phone', user.phoneNumber ?? 'Not provided'),
            _buildProfileItem('Location', 'Bangladesh'),
            if (user.emailVerified)
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.verified, color: Colors.green, size: 18),
                    SizedBox(width: 5),
                    Text('Verified', style: TextStyle(color: Colors.green)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
