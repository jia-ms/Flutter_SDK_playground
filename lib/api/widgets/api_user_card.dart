import 'package:flutter/material.dart';
import 'package:counterapp/api/models/api_user.dart';
import 'package:counterapp/api/widgets/section_tile.dart';

class ApiUserCard extends StatelessWidget {
  final ApiUser user;

  const ApiUserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        title: Text(user.name),
        subtitle: Text("@${user.username}"),
        children: [
          const Divider(height: 1),

          SectionTile(
            icon: Icons.person,
            title: "User Info",
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT COLUMN
                Expanded(
                  child: Column(
                    children: [
                      InfoTile(
                        icon: Icons.numbers,
                        label: "ID",
                        value: user.id.toString(),
                      ),

                      InfoTile(
                        icon: Icons.star_border,
                        label: "username",
                        value: user.username.toString(),
                      ),

                      InfoTile(
                        icon: Icons.person_outline,
                        label: "Name",
                        value: user.name.toString(),
                      ),

                      InfoTile(
                        icon: Icons.email_outlined,
                        label: "Email",
                        value: user.email.toString(),
                      ),

                    ],
                  ),
                ),

                const SizedBox(width: 10),

                // RIGHT COLUMN
                Expanded(
                  child: Column(
                    children: [
                      InfoTile(
                        icon: Icons.house_outlined,
                        label: "Address",
                        value: user.address.toString(),
                      ),

                      InfoTile(
                        icon: Icons.phone_outlined,
                        label: "Phone",
                        value: user.phone.toString(),
                      ),

                      InfoTile(
                        icon: Icons.language,
                        label: "Website",
                        value: user.website.toString(),
                      ),

                      InfoTile(
                        icon: Icons.logo_dev,
                        label: "Company",
                        value: user.company.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}