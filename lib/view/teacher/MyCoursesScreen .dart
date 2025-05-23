import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddCoursePage extends StatefulWidget {
  @override
  _AddCoursePageState createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? selectedGrade;
  String schoolId = 'your_school_id_here'; // Ideally fetched from profile

  final List<String> grades = [
    '1ère année primaire',
    '2ème année primaire',
    '3ème année primaire',
    '4ème année primaire',
    '5ème année primaire',
    '1ère année moyenne',
    '2ème année moyenne',
    '3ème année moyenne',
    '4ème année moyenne',
    '1ère année secondaire',
    '2ème année secondaire',
    '3ème année secondaire',
  ];

  void addCourse() async {
    final courseName = nameController.text.trim();
    final description = descriptionController.text.trim();
    final teacherId = Supabase.instance.client.auth.currentUser?.id;

    if (courseName.isNotEmpty && selectedGrade != null) {
      await Supabase.instance.client.from('courses').insert({
        'name': courseName,
        'description': description,
        'grade': selectedGrade,
        'teacher_id': teacherId,
        'school_id': schoolId,
        'created_at': DateTime.now().toIso8601String(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cours ajouté avec succès')),
      );
      nameController.clear();
      descriptionController.clear();
      setState(() => selectedGrade = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8E9EFB),
      appBar: AppBar(
        title: Text('Ajouter un cours'),
        backgroundColor:  Color(0xFFB8C6DB),
        elevation: 0,
        centerTitle: true,
        foregroundColor: Color(0xFF8E9EFB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField(
                controller: nameController,
                hint: "Nom du cours",
                icon: FontAwesomeIcons.bookOpen,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: descriptionController,
                hint: "Description",
                icon: FontAwesomeIcons.alignLeft,
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              _buildDropdown(),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: Icon(Icons.add),
                label: Text("Ajouter le cours"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF345FB4),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  textStyle: TextStyle(fontSize: 16),
                  elevation: 5,
                ),
                onPressed: addCourse,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FaIcon(icon, color: Color(0xFF345FB4)),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonFormField<String>(
        value: selectedGrade,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.grade, color: Color(0xFF345FB4)),
        ),
        hint: Text('Niveau'),
        items: grades.map((grade) {
          return DropdownMenuItem(
            value: grade,
            child: Text(grade),
          );
        }).toList(),
        onChanged: (value) => setState(() => selectedGrade = value),
      ),
    );
  }
}







