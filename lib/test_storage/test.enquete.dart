// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:provider/provider.dart';

// import '../app.style.dart';
// import '../size.config.dart';

// class TestEnquete extends StatefulWidget {
//   const TestEnquete({super.key});

//   @override
//   State<TestEnquete> createState() => _TestEnqueteState();
// }

// class _TestEnqueteState extends State<TestEnquete> {
//   Map pulling = {};
//   voteYesNo(String voto) async {
//     try {
//       FirebaseFirestore db = FirebaseFirestore.instance;
//       final ref = db
//           .collection('pollings')
//           .doc('polling1')
          
      
//     } catch (e) {
//       print('erro que deu : $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: Icon(
//                 Icons.navigate_before,
//                 color: kDarkGrey,
//                 size: SizeConfig.blockSizeHorizontal! * 7.5,
//               ),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             );
//           },
//         ),
//         backgroundColor: kLightWhite,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.help_center,
//               color: kDarkGrey,
//               size: SizeConfig.blockSizeHorizontal! * 7.5,
//             ),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       backgroundColor: kLightWhite,
//       body: SafeArea(
//         child: ListView(
//           padding: const EdgeInsets.only(bottom: 40),
//           children: [
//             //TITULO
//             Padding(
//               padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
//               child: Text('Test',
//                   style: kPoppinsBold.copyWith(
//                       fontSize: SizeConfig.blockSizeHorizontal! * 5,
//                       color: kDarkBlue)),
//             ),
//             const SizedBox(height: 20),

//             IconButton(
//                 onPressed: () {
//                   voteYesNo('sim');
//                 },
//                 icon: Icon(Icons.add)),
//             const SizedBox(height: 20),

//             IconButton(
//                 onPressed: () {
//                   voteYesNo('nao');
//                 },
//                 icon: Icon(Icons.delete))
//           ],
//         ),
//       ),
//     );
//   }
// }
