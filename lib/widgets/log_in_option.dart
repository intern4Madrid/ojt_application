// import 'package:flutter/material.dart';
//
// class LogInOption extends StatelessWidget {
//   const LogInOption({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         GestureDetector(
//           onTap: () {},
//           child: BuildButton(
//             iconImage: Image(
//               height: 20,
//               width: 20,
//               image: AssetImage("images/facebook.png"),
//             ),
//             textButton: "Facebook",
//           ),
//         ),
//         GestureDetector(
//           onTap: () {},
//           child: BuildButton(
//             iconImage: Image(
//               height: 20,
//               width: 20,
//               image: AssetImage("images/google.png"),
//             ),
//             textButton: "Google",
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class BuildButton extends StatelessWidget {
//   final Image iconImage;
//   final String textButton;
//   BuildButton({required this.iconImage, required this.textButton});
//   @override
//   Widget build(BuildContext context) {
//     var mediaQuery = MediaQuery.of(context).size;
//     return Container(
//       height: mediaQuery.height * 0.06,
//       width: mediaQuery.width * 0.36,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: Colors.red),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           iconImage,
//           SizedBox(
//             width: 5,
//           ),
//           Text(textButton),
//         ],
//       ),
//     );
//   }
// }
