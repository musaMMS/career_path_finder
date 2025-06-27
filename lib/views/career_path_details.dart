import 'package:flutter/material.dart';

class CareerDetailsScreen extends StatelessWidget {
  final String title;
  final String responsibilities;
  final String requiredSkills;
  final String jobFields;
  final String averageIncome;
  final String educationPath;

  const CareerDetailsScreen({
    super.key,
    required this.title,
    required this.responsibilities,
    required this.requiredSkills,
    required this.jobFields,
    required this.averageIncome,
    required this.educationPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle('📝 Responsibilities'),
          _buildSectionContent(responsibilities),
          const SizedBox(height: 16),

          _buildSectionTitle('🛠 Required Skills'),
          _buildSectionContent(requiredSkills),
          const SizedBox(height: 16),

          _buildSectionTitle('🌍 Job Fields / Sectors'),
          _buildSectionContent(jobFields),
          const SizedBox(height: 16),

          _buildSectionTitle('💰 Average Income'),
          _buildSectionContent(averageIncome),
          const SizedBox(height: 16),

          _buildSectionTitle('🎓 Education Path'),
          _buildSectionContent(educationPath),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSectionContent(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
