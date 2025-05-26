import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Main App Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRED Profile UI',
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

// Profile Screen
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {},
        ),
        title: Text("Profile", style: TextStyle(color: Colors.white)),
        actions: [
          Row(
            children: [
              Icon(Icons.headset_mic, color: Colors.white),
              SizedBox(width: 4),
              Text("support", style: TextStyle(color: Colors.white)),
              SizedBox(width: 12),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(),
              SizedBox(height: 20),
              buildGarageRow(),
              SizedBox(height: 20),
              buildVehicleCard(),
              SizedBox(height: 20),
              buildRewards(),
              SizedBox(height: 20),
              buildTransactions(),
            ],
          ),
        ),
      ),
    );
  }

  // Profile header with image and name
  Widget buildHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/profile.jpg'),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("andaz Kumar", style: TextStyle(color: Colors.white, fontSize: 18)),
            Text("member since Dec, 2020", style: TextStyle(color: Colors.grey)),
          ],
        ),
        Spacer(),
        Icon(Icons.edit, color: Colors.grey),
      ],
    );
  }

  // CRED Garage styled row
  Widget buildGarageRow() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.directions_car, color: Colors.white),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("CRED garage",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("get to know your vehicles, inside out",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
        ],
      ),
    );
  }

  // Vehicle info card
  Widget buildVehicleCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          buildInfoRow("credit score", "757",
              actionText: "REFRESH AVAILABLE", icon: Icons.credit_score),
          Divider(color: Colors.grey),
          buildInfoRow("lifetime cashback", "₹3", icon: Icons.currency_rupee),
          Divider(color: Colors.grey),
          buildInfoRow("bank balance", "check", icon: Icons.account_balance),
        ],
      ),
    );
  }

  // Rows inside info card
  Widget buildInfoRow(String title, String value,
      {String? actionText, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Row(
              children: [
                Text(title, style: TextStyle(color: Colors.white)),
                if (actionText != null) ...[
                  SizedBox(width: 5),
                  Text("• $actionText", style: TextStyle(color: Colors.green, fontSize: 12)),
                ],
              ],
            ),
          ),
          Text(value, style: TextStyle(color: Colors.white)),
          SizedBox(width: 5),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
        ],
      ),
    );
  }

  // Rewards Section
// Rewards Section with lines
  Widget buildRewards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("YOUR REWARDS & BENEFITS", style: TextStyle(color: Colors.grey)),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              buildRewardTile("cashback balance", "₹0"),
              Divider(color: Colors.grey[700], height: 1),
              buildRewardTile("coins", "26,46,583"),
              Divider(color: Colors.grey[700], height: 1),
              buildRewardTile("win upto ₹1000", "refer and earn"),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildRewardTile(String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12),
      title: Text(title, style: TextStyle(color: Colors.white)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
    );
  }

  // Transactions Section
  Widget buildTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("TRANSACTIONS & SUPPORT", style: TextStyle(color: Colors.grey)),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          title: Text("all transactions", style: TextStyle(color: Colors.white)),
          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
        ),
      ],
    );
  }
}
