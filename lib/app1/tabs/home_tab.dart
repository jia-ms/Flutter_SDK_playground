import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Afternoon 😎",
                        style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Jia M S",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                        ),
                      ),
                    ],
                  ),

                  CircleAvatar(
                   // radius: 48,
                    backgroundImage: CachedNetworkImageProvider(
                      "https://img.magnific.com/free-vector/stylish-welcome-lettering-banner-join-with-joy-happiness_1017-57675.jpg?semt=ais_hybrid&w=740&q=80",
                    ),
                  ),
                ],
              ),

              Divider(thickness: 0.8),
              SizedBox(height: 8),

              // Balance Card
              Container(
                height: 200,
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.orange.withValues(alpha: 0.80),
                      Colors.yellow.withValues(alpha: 0.6),
                      Colors.red.withValues(alpha: 0.72),
                      Colors.green,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.4),
                      blurRadius: 42,
                      offset: const Offset(0, 20),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total Balance",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      "₹ 89000",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "*** ** 5290",
                          style: TextStyle(color: Colors.white),
                        ),
                        const Text(
                          "VISA",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text("Quick Actions"),
              const SizedBox(height: 16),

              Row(
                children: [
                  actionButton(Icons.send, "Send Money"),
                  actionButton(Icons.receipt_long, " My Transaction"),
                  actionButton(Icons.add_card, "Add Cards"),
                  Spacer(),
                  actionButton(Icons.more_horiz, "More"),
                ],
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Analytics View",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  Text("View All", style: TextStyle(color: Colors.blue)),
                ],
              ),
              const SizedBox(height: 16),

              Container(
                height: 220,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Monthly Spending",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          bar(hei: 80),
                          bar(hei: 120, col: Colors.redAccent),
                          bar(hei: 60),
                          bar(hei: 40),
                          bar(hei: 150, col: Colors.red),
                          bar(hei: 20, col: Colors.green),
                          bar(hei: 50),
                          bar(hei: 45, col: Colors.orange),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Recent Transactions",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 8),

              transaction(
                Icons.shopping_bag,
                "Myntra Purchase",
                "Debited at online shopping items",
                "- 4500",
              ),
              transaction(
                Icons.restaurant,
                "Restaurant",
                "For 2 Peoples",
                "- 1200",
              ),
              transaction(
                Icons.movie,
                "Movie Ticket",
                "Movie tonight at PVR",
                "- 420",
              ),
              transaction(
                Icons.public_rounded,
                "Project Sales",
                "Hurray, Earned",
                "+ 2000",
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget actionButton(IconData icon, String title) {
    return Column(
      spacing: 2,
      children: [
        Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 60,
          width: 60,
          child: Icon(icon),
        ),
      ],
    );
  }

  static Widget bar({required double hei, Color? col}) {
    return Container(
      height: hei,
      width: 25,
      decoration: BoxDecoration(
        color: col ?? Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  static Widget transaction(
      IconData icon,
      String label,
      String trDescp,
      String amount,
      ) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ListTile(
        trailing: Text(
          amount,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        title: Text(label),
        subtitle: Text(trDescp),
        leading: Icon(icon),
      ),
    );
  }
}