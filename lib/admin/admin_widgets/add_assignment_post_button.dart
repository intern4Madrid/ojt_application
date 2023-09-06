import 'package:flutter/material.dart';
import 'package:ojt_app/admin/admin_widgets/bottom_navigation_bar_widgets.dart';
import 'package:ojt_app/utils/getter_setter/taskkk_getter_setter.dart';

class PostButton extends StatelessWidget {
  const PostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      onPressed: () {
        Taskkk.getAssign();
        Taskkk.getDescription();
        Taskkk.getDueDate();
        Taskkk.getUploadFile();

        print(Taskkk.getDueDate());
        print(Taskkk.getDescription());
        print(Taskkk.getAssign());
        print(Taskkk.getUploadFile());

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavigation(),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 340,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.red.shade900,
              Colors.red,
              Colors.red.shade400,
            ],
          ),
        ),
        child: Text(
          'Post',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
