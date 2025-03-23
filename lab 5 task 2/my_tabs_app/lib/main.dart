import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.person), text: "Introduction"),
            Tab(icon: Icon(Icons.school), text: "Education"),
            Tab(icon: Icon(Icons.favorite), text: "Hobbies"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          IntroTab(),
          EducationTab(),
          HobbiesTab(),
        ],
      ),
    );
  }
}

// First Tab: Introduction
class IntroTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 20, color: Colors.black),
          children: [
            TextSpan(text: "Hi, I'm ", style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "Saad Hassan", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            TextSpan(text: ". I'm a Flutter developer passionate about building mobile apps and i love frontend."),
          ],
        ),
      ),
    );
  }
}

// Second Tab: Education
class EducationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 20, color: Colors.black),
          children: [
            TextSpan(text: "I am doing my ", style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "BSc in Computer Science ", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            TextSpan(text: "from Bahria University."),
          ],
        ),
      ),
    );
  }
}

// Third Tab: Hobbies
class HobbiesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 20, color: Colors.black),
          children: [
            TextSpan(text: "I love ", style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "coding, playing Valorant", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            TextSpan(text: ", and exploring new technologies."),
          ],
        ),
      ),
    );
  }
}
