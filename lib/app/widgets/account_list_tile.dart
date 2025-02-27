import 'package:flutter/material.dart';

    class AccountListTile extends StatelessWidget {
      final String title;
      final IconData icon;

      AccountListTile({required this.title, required this.icon});

      @override
      Widget build(BuildContext context) {
        return Column(
          children: [
            ListTile(
              leading: Icon(icon),
              title: Text(title),
              trailing: Icon(Icons.arrow_forward_ios, size: 20),
              contentPadding: EdgeInsets.zero,
            ),
            Divider(height: 1),
          ],
        );
      }
    }