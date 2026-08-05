import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(title: Text("Profile"), centerTitle: true),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 56,
                backgroundImage: CachedNetworkImageProvider(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYjoR0CkS1HN2mR5sbbRKcnCnXsRn9y_zJ7dwSBdqc4Q&s=10"
                ),
              ),
              const SizedBox(height: 16),
              const Text("Jia"),
              const Text("jiams@gmail.com"),
              const SizedBox(height: 16),

              ElevatedButton(onPressed: () {},child: Text("Edit Profile")),
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  child:Padding(
                    padding:const EdgeInsets.symmetric(vertical: 20.0),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text("Posts"),
                            const SizedBox(height: 5),
                            Text("56"),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Followers"),
                            const SizedBox(height: 5),
                            Text("1M"),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Following"),
                            const SizedBox(height: 5),
                            Text("272"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height:32),

              Text(
                "App Settings",
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 8),

              Card(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child:Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.person_outline),
                      title: Text("Manage Account"),
                      subtitle: Text("Edit you account settings"),
                      trailing: Icon(Icons.navigate_next, size: 16),
                    ),
                    Divider(height:1),
                    ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text("Notifications"),
                      trailing: Icon(Icons.navigate_next, size: 16),
                    ),
                    Divider(height:1),

                    ListTile(
                      leading: Icon(Icons.lock_outline),
                      title: Text("Privacy"),
                      trailing: Icon(Icons.navigate_next, size: 16),
                    ),
                    Divider(height: 1),
                    ListTile(
                      leading: Icon(Icons.person_outline),
                      title: Text("Help & Support"),
                      trailing: Icon(Icons.navigate_next,size: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}