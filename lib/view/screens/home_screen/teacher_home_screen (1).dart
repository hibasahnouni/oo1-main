import 'package:flutter/material.dart';
import 'package:oo/view/student/notifications_screen.dart';
import 'package:oo/view/teacher/CahierDeTexteScreen.dart';
import 'package:oo/view/teacher/ChangePasswordScreen.dart';
import 'package:oo/view/teacher/EmploiDuTempsScreen.dart';
import 'package:oo/view/teacher/ExamResultsScreen.dart';



import 'package:oo/view/teacher/SyllabusScreen.dart';
import 'package:oo/view/screens/login_screen/login_screen.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../teacher/MesCoursScreen.dart';
import '../../teacher/StudentsListScreen.dart';





class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({Key? key}) : super(key: key);
  static String routeName = 'TeacherHomeScreen';

  final Gradient backgroundGradient = const LinearGradient(
    colors: [Color(0xFF8E9EFB), Color(0xFFB8C6DB)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    String teacherName = 'Mr. Karim B.';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              height: 160,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Text(
                        "Espace Professeur",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        icon: const Icon(Icons.logout, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Bienvenue, $teacherName 👋",
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // CARTES
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.95,
                children: [

                  TeacherCard(
                    icon: Icons.group_add,
                    title: "Assign Course",
                    onTap: () {
                      final teacherId = Supabase.instance.client.auth.currentUser?.id;
                      if (teacherId != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddCourseMaterialScreen(teacherId: teacherId),
                          ),
                        );
                      } else {
                        // Show error or redirect to login
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('You must be logged in.')),
                        );
                      }
                    },
                  ),


                  TeacherCard(icon: Icons.assignment, title: "Cahier de texte", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CahierDeTexteScreen()))),
                  TeacherCard(icon: Icons.schedule, title: "Emploi du temps", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => EmploiDuTempsScreen()))),
                  TeacherCard(icon: Icons.notifications, title: "Notifications", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => NotificationsScreen()))),
                  TeacherCard(icon: Icons.lock, title: "Mot de passe", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChangePasswordScreen()))),
                  TeacherCard(icon: Icons.picture_as_pdf, title: "List of student", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => StudentListPage()))),
                  TeacherCard(icon: Icons.assignment_turned_in, title: "Résultats examens", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddStudentGradeScreen()))),
                  TeacherCard(icon: Icons.picture_as_pdf, title: "Syllabus", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SyllabusScreen()))),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}



class TeacherCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const TeacherCard({

    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Color(0xFF345FB4)),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF345FB4),
              ),
            ),
          ],
        ),
      ),
    );
  }}
