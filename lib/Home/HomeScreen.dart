import 'package:career_path_finder/views/career_path_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double screenWidth;
  late double screenHeight;
  late double fontScale;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    fontScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title: Text('Career Path Finder', style: TextStyle(fontSize: 18 * fontScale)),
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
                  decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: const Text("3", style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Section
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/short.png'),
                  // Add error handling if needed
                ),
                const SizedBox(width: 12),
                Text(
                  "Hello, Musa!",
                  style: TextStyle(fontSize: 18 * fontScale, fontWeight: FontWeight.w600),
                ),
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
              height: screenHeight * 0.18,
              child: PageView(
                children: [
                  _buildAnimatedTrendingCard("AI Engineer", "assets/mmm.jpeg"),
                  _buildAnimatedTrendingCard("Web Developer", "assets/mmm.jpeg"),
                  _buildAnimatedTrendingCard("Cybersecurity Expert", "assets/mmm.jpeg"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Career Paths
            Text(
              "🎯 Choose a Career Path",
              style: TextStyle(fontSize: 18 * fontScale, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 600),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(child: widget),
                  ),
                  children: [
                    _buildCareerCard("Flutter Developer", "assets/mmm.jpeg"),
                    _buildCareerCard("Graphics Designer", "assets/mmm.jpeg"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Top Companies
            Text(
              "🏢 Top Companies Hiring",
              style: TextStyle(fontSize: 18 * fontScale, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 600),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(child: widget),
                  ),
                  children: [
                    _buildCompanyTile("Google", "Remote • Flutter", "assets/google.png"),
                    _buildCompanyTile("Meta", "Onsite • UI/UX", "assets/meta.png"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Motivation Quote
            Card(
              color: Colors.deepPurple.shade100,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "\"Success is not final; failure is not fatal: It is the courage to continue that counts.\"",
                  style: TextStyle(fontSize: 16 * fontScale, fontStyle: FontStyle.italic),
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
              style: ElevatedButton.styleFrom(
                minimumSize: Size(screenWidth, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCareerCard(String title, String imagePath) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: 40,
          errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.broken_image, size: 40),
        ),
        title: Text(title, style: TextStyle(fontSize: 16 * fontScale)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CareerDetailsScreen(title: '', responsibilities: '', requiredSkills: '', jobFields: '', averageIncome: '', educationPath: '')));
        },
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
          Image.asset(
            image,
            width: 30,
            errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, size: 30),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 18 * fontScale, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedTrendingCard(String title, String image) {
    return AnimationConfiguration.synchronized(
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        horizontalOffset: 30.0,
        child: FadeInAnimation(
          child: _buildTrendingCard(title, image),
        ),
      ),
    );
  }

  Widget _buildCompanyTile(String name, String desc, String logo) {
    return ListTile(
      leading: Image.asset(
        logo,
        width: 40,
        errorBuilder: (context, error, stackTrace) =>
        const Icon(Icons.business, size: 40),
      ),
      title: Text(name, style: TextStyle(fontSize: 16 * fontScale)),
      subtitle: Text(desc, style: TextStyle(fontSize: 13 * fontScale)),
      trailing: const Icon(Icons.work),
      onTap: () {},
    );
  }
}
