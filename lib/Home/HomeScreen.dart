import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Career Path Finder'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // Notification page
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: const Text("3", style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              )
            ],
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Greeting Section
          Row(
            children: const [
              CircleAvatar(radius: 24, backgroundImage: AssetImage('assets/user.png')),
              SizedBox(width: 12),
              Text("Hello, Musa!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 20),

          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: "Search career or job...",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 20),

          // Trending Career Carousel
          SizedBox(
            height: 150,
            child: PageView(
              children: [
                _buildTrendingCard("AI Engineer", "assets/ai.png"),
                _buildTrendingCard("Web Developer", "assets/web.png"),
                _buildTrendingCard("Cybersecurity Expert", "assets/cyber.png"),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Career Paths
          const Text("🎯 Choose a Career Path", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          _buildCareerCard("Flutter Developer", "assets/flutter.png"),
          _buildCareerCard("Graphics Designer", "assets/design.png"),

          // Top Companies
          const SizedBox(height: 30),
          const Text("🏢 Top Companies Hiring", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          _buildCompanyTile("Google", "Remote • Flutter", "assets/google.png"),
          _buildCompanyTile("Meta", "Onsite • UI/UX", "assets/meta.png"),

          // Motivation Quote
          const SizedBox(height: 30),
          Card(
            color: Colors.deepPurple.shade100,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "\"Success is not final; failure is not fatal: It is the courage to continue that counts.\"",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ),
          ),

          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/quiz');
            },
            icon: const Icon(Icons.quiz),
            label: const Text("Take Career Quiz"),
            style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
          )
        ],
      ),
    );
  }

  Widget _buildCareerCard(String title, String imagePath) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(imagePath, width: 40),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
    );
  }

  Widget _buildTrendingCard(String title, String image) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(image, width: 25),
          const SizedBox(width: 10),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget _buildCompanyTile(String name, String desc, String logo) {
    return ListTile(
      leading: Image.asset(logo, width: 40),
      title: Text(name),
      subtitle: Text(desc),
      trailing: const Icon(Icons.work),
      onTap: () {
        // Job Details Page
      },
    );
  }
}
