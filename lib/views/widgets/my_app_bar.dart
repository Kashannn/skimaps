import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

AppBar myAppBar() {
  return AppBar(
    centerTitle: true,
    title: Image.asset(
      'assets/logo.png',
      fit: BoxFit.cover,
      width: 70.0,
    ),
  );
}
// class MyAppBar extends StatelessWidget {
//   const MyAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Image.asset(
//         'assets/logo.png',
//         fit: BoxFit.cover,
//         width: 70.0,
//       ),
//     );
//   }
// }
