import 'package:flutter/material.dart';
import 'package:workers_app/CommonScreens/colors.dart';

class ProfileInfoCard extends StatelessWidget {
  final String icon;
  final String label;
  final String value;
  final Color iconColor;

  const ProfileInfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colors.task_list_color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: colors.profile_card_iconcolor,
            child: Image.asset(icon, scale: 4.5),
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: colors.task_text_color,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
