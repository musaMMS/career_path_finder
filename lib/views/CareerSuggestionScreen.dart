import 'package:flutter/material.dart';

class CareerSuggestionScreen extends StatefulWidget {
  const CareerSuggestionScreen({super.key});

  @override
  _CareerSuggestionScreenState createState() => _CareerSuggestionScreenState();
}

class _CareerSuggestionScreenState extends State<CareerSuggestionScreen> {
  final _formKey = GlobalKey<FormState>();

  // Example questions
  String? interest;
  String? skillLevel;
  String? subject;

  String? careerResult;

  void suggestCareer() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Rule-based simple logic (can be replaced with AI later)
      if (interest == 'Technology' && skillLevel == 'Advanced' && subject == 'Math') {
        careerResult = 'Software Engineer';
      } else if (interest == 'Helping Others' && skillLevel == 'Intermediate' && subject == 'Biology') {
        careerResult = 'Nurse / Healthcare Assistant';
      } else if (interest == 'Design' && skillLevel == 'Beginner' && subject == 'Arts') {
        careerResult = 'Graphic Designer';
      } else {
        careerResult = 'Try exploring more skills or interests!';
      }

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Career Path Finder')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text('What is your primary interest?', style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButtonFormField<String>(
                value: interest,
                items: ['Technology', 'Helping Others', 'Design'].map((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value));
                }).toList(),
                onChanged: (val) => setState(() => interest = val),
                onSaved: (val) => interest = val,
                validator: (val) => val == null ? 'Please select an interest' : null,
              ),
              SizedBox(height: 20),

              Text('What is your skill level?', style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButtonFormField<String>(
                value: skillLevel,
                items: ['Beginner', 'Intermediate', 'Advanced'].map((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value));
                }).toList(),
                onChanged: (val) => setState(() => skillLevel = val),
                onSaved: (val) => skillLevel = val,
                validator: (val) => val == null ? 'Please select skill level' : null,
              ),
              SizedBox(height: 20),

              Text('What subject do you like most?', style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButtonFormField<String>(
                value: subject,
                items: ['Math', 'Biology', 'Arts'].map((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value));
                }).toList(),
                onChanged: (val) => setState(() => subject = val),
                onSaved: (val) => subject = val,
                validator: (val) => val == null ? 'Please select a subject' : null,
              ),
              SizedBox(height: 30),

              ElevatedButton(
                onPressed: suggestCareer,
                child: Text('Suggest Career'),
              ),

              SizedBox(height: 30),

              if (careerResult != null)
                Card(
                  color: Colors.blue.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Suggested Career: $careerResult',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
