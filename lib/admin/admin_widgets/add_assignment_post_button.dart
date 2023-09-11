import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ojt_app/core/services/add_assignment_api.dart';
import 'package:ojt_app/utils/getter_setter/taskkk_getter_setter.dart';

class PostButton extends StatefulWidget {
  const PostButton({super.key});

  @override
  State<PostButton> createState() => _PostButtonState();
}

class _PostButtonState extends State<PostButton> {
  @override
  Widget build(BuildContext context) {
    final saveAssignment assignmentApi = saveAssignment();
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      onPressed: () async {
        if (Taskkk.getAssign() != null &&
            Taskkk.getDescription() != null &&
            Taskkk.getDueDate() != null) {
          try {
            http.Response response = await assignmentApi.assignment(
                Taskkk.getAssign(),
                Taskkk.getDescription(),
                Taskkk.getDueDate(),
                Taskkk.getLink(),
                Taskkk.getEmail(),
                // Taskkk.getUploadFile(),
                Taskkk.getUserID());
            print(
              Taskkk.getAssign(),
            );
            print(Taskkk.getDescription());
            print(
              Taskkk.getDueDate(),
            );
            print(
              Taskkk.getEmail(),
            );
            print(
              Taskkk.getLink(),
            );
            if (response.statusCode == 200) {
              print('<<<<<<ALREADY ADDED A ASSIGNMET>>>>>>>>');
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text(
                    'Successful',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  content: Text("New user successfully created"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Done'),
                    ),
                  ],
                ),
              );
            }
            // print(response.body);
          } catch (e) {
            debugPrint(e.toString());
          }
        } else {
          debugPrint('checking data');
        }
      },
      // onPressed: () async {
      //   int taskID = 3;
      //   String assignmentTitle = Taskkk.getAssign();
      //   String description = Taskkk.getDescription();
      //   String duedate = Taskkk.getDueDate();
      //   String link = "";
      //   String uploadFile = Taskkk.getUploadFile();
      //   String status = "Complete";
      //
      //   try {
      //     final response = await assignmentApi.assignment(
      //       taskID,
      //       assignmentTitle,
      //       description,
      //       duedate,
      //       status,
      //       link,
      //       uploadFile,
      //     );
      //
      //     if (response.statusCode == 200) {
      //       print('Assignment added successfully');
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => BottomNavigation(),
      //         ),
      //       );
      //     } else {
      //       print('Failed to add assignment');
      //     }
      //   } catch (error) {
      //     print('Error during API request: $error');
      //     // Handle the error as needed
      //   }
      // },
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
