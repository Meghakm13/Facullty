import 'package:ddd/widgets/faculty_details_card.dart';
import 'package:flutter/material.dart';
import '../models/faculty_model.dart';
import '../screens/add_edit_faculty_screen.dart';
import '../services/faculty_service.dart';

class FacultyCard extends StatelessWidget {
  final Faculty faculty;
  final VoidCallback onDelete;
  final VoidCallback onRefresh;

  const FacultyCard({
    super.key,
    required this.faculty,
    required this.onDelete,
    required this.onRefresh,
  });

  void _confirmDelete(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Delete Faculty'),
        content: Text('Are you sure you want to delete this faculty?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text('Delete', style: TextStyle(color: Colors.red))),
        ],
      ),
    );

    if (confirm == true) {
      await FacultyService.deleteFaculty(faculty.id.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Faculty deleted')));
      onDelete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Color(0xFFB2D8CE),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => FacultyDetailsCard(faculty: faculty)));
        },
        title: Text(
          faculty.name,
          style: TextStyle(
            color: Color(0xFF52357B),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(faculty.department),
        trailing: PopupMenuButton<String>(
          icon: Icon(Icons.more_vert, color: Color(0xFF5459AC)),
          onSelected: (value) {
            if (value == 'edit') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddEditFacultyScreen(faculty: faculty),
                ),
              ).then((_) => onRefresh());
            } else if (value == 'delete') {
              _confirmDelete(context);
            }
          },
          itemBuilder: (_) => [
            PopupMenuItem(value: 'view', child: Text('View')),
            PopupMenuItem(value: 'edit', child: Text('Edit')),
            PopupMenuItem(value: 'delete', child: Text('Delete')),
          ],
        ),
      ),
    );
  }
}
