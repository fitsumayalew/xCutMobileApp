// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class RatingModal extends StatefulWidget {
//   RatingModal({Key key}) : super(key: key);

//   @override
//   _RatingModalState createState() => _RatingModalState();
// }

// class _RatingModalState extends State<RatingModal> {
//   final _formKey = GlobalKey<FormState>();
//     final Map<String, dynamic> _user = {};

//   @override
//   Widget build(BuildContext context) {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   TextFormField(
//                     keyboardType: TextInputType.multiline,
//                     maxLines: 5,
//                   decoration: InputDecoration(
//                       hintText: 'Review',
//                       hintStyle: GoogleFonts.poppins(color: Colors.grey.shade700, letterSpacing: 0.5),
//                       contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
//                       filled: true,
//                     fillColor: Colors.white70,
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                         borderSide: BorderSide(color: Colors.grey.shade700, width: 1),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                         borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.5),
//                       ),
//                     ) ,
//                     validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter email';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     setState(() {
//                       // this._user['email'] = value.trim();
//                       this._user['email'] = 'amexabiy@gmail.com';
//                     });
//                   }),
//                   TextFormField(
//                   decoration: InputDecoration(
//                       hintText: 'rating',
//                       hintStyle: GoogleFonts.poppins(color: Colors.grey.shade700, letterSpacing: 0.5),
//                       contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
//                       filled: true,
//                     fillColor: Colors.white70,
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                         borderSide: BorderSide(color: Colors.grey.shade700, width: 1),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                         borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.5),
//                       ),
//                     ),
//                     validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter email';
//                     }
//                     return null;
//                     },
//                     onSaved: (value) {
//                       setState(() {
//                         // this._user['email'] = value.trim();
//                         this._user['email'] = 'amexabiy@gmail.com';
//                       });
//                     }),
//                 ]
//               )
//               ),
//             );
//       }
//         );
//   }

//                 }
// }

//       olumn(
//         childrem: [
//           TextFormField(
//             keyboardType: TextInputType.multiline,
//             maxLines: 5
//            decoration: InputDecoration(
//               hintText: 'Review',
//               hintStyle: GoogleFonts.poppins(color: Colors.grey.shade700, letterSpacing: 0.5),
//               contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
//               filled: true,
//             fillColor: Colors.white70,
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                 borderSide: BorderSide(color: Colors.grey.shade700, width: 1),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                 borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.5),
//               ),
//             )
//           ),TextFormField(
//            decoration: InputDecoration(
//               hintText: 'rating',
//               hintStyle: GoogleFonts.poppins(color: Colors.grey.shade700, letterSpacing: 0.5),
//               contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
//               filled: true,
//             fillColor: Colors.white70,
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                 borderSide: BorderSide(color: Colors.grey.shade700, width: 1),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                 borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.5),
//               ),
//             )
//           )
//         ]
//       )
//     );
//   }
// }
