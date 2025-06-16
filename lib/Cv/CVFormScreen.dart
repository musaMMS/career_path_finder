import 'package:flutter/material.dart';
import 'cv_full_pdf.dart';

class CVFormScreen extends StatefulWidget {
  const CVFormScreen({super.key});

  @override
  State<CVFormScreen> createState() => _CVFormScreenState();
}

class _CVFormScreenState extends State<CVFormScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final summaryController = TextEditingController();
  final skillsController = TextEditingController();
  final educationController = TextEditingController();
  final experienceController = TextEditingController();
  final projectsController = TextEditingController();
  final languagesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CV Generator")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTextField("Full Name", nameController),
            _buildTextField("Email", emailController),
            _buildTextField("Phone", phoneController),
            _buildTextField("Address", addressController),
            _buildTextField("Profile Summary", summaryController, maxLines: 3),
            _buildTextField("Skills (comma separated)", skillsController),
            _buildTextField("Education", educationController, maxLines: 2),
            _buildTextField("Experience", experienceController, maxLines: 2),
            _buildTextField("Projects", projectsController, maxLines: 2),
            _buildTextField("Languages Known", languagesController),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => CVFullPdfScreen(
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    address: addressController.text,
                    summary: summaryController.text,
                    skills: skillsController.text,
                    education: educationController.text,
                    experience: experienceController.text,
                    projects: projectsController.text,
                    languages: languagesController.text,
                  ),
                ));
              },
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text("Generate CV PDF"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
