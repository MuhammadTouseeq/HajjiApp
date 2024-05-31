// import 'dart:ui';
//
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../core/utils/color_constant.dart';
//
//
// // TextStyle textStyle = GoogleFonts.roboto(
// //   fontSize: 14,
// // );
//
// class MyMultiText extends StatefulWidget {
//   final String tiltle1;
//   final String title2;
//
//   final String? weight1;
//   final String? weight2;
//
//   final FontWeight? customWeight1;
//   final FontWeight? customWeight2;
//   final FontWeight? customWeight3;
//   final Color? clr1;
//   final Color? clr2;
//   final double? size1;
//   final double? size2;
//
//   final double? height;
//   final bool? under, cut;
//   Function? onTap1;
//   Function? onTap2;
//   final List<FontFeature>? fontFeatures;
//   int? maxLiness;
//
//   MyMultiText({
//     required this.tiltle1,
//     required this.title2,
//     this.size1,
//     this.size2,
//     this.clr1,
//     this.clr2,
//     this.fontFeatures,
//     this.height,
//     this.under,
//     this.cut,
//     this.weight1,
//     this.weight2,
//     this.customWeight3,
//     this.customWeight1,
//     this.customWeight2,
//     this.maxLiness,
//     this.onTap1,
//     this.onTap2,
//   });
//
//   @override
//   _MyMultiTextState createState() => _MyMultiTextState();
// }
//
// class _MyMultiTextState extends State<MyMultiText> {
//  // ColorConfig colors = ColorConfig();
//
//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       maxLines: widget.maxLiness ?? 1,
//       text: TextSpan(
//         style: const TextStyle(
//           color: Colors.black,
//         ),
//         children: <TextSpan>[
//           TextSpan(
//             text: widget.tiltle1,
//             recognizer: TapGestureRecognizer()..onTap = (){
//               widget.onTap1!();
//             },
//             style: GoogleFonts.montserrat(
//                 fontFeatures: widget.fontFeatures,
//                 height: widget.height,
//                 decoration: widget.under == true
//                     ? TextDecoration.underline
//                     : widget.cut == true
//                     ? TextDecoration.lineThrough
//                     : TextDecoration.none,
//                 fontSize: widget.size1,
//                 color: widget.clr1 ?? ColorConstant.hintTextColor,
//                 fontWeight: widget.customWeight1 != null
//                     ? widget.customWeight1
//                     : widget.weight1 == null
//                     ? FontWeight.normal
//                     : widget.weight1 == "Bold"
//                     ? FontWeight.bold
//                     : widget.weight1 == "Semi Bold"
//                     ? FontWeight.w600
//                     : FontWeight.normal),
//           ),
//           TextSpan(
//             text: widget.title2,
//             recognizer: TapGestureRecognizer()..onTap = (){
//               widget.onTap2!();
//             },
//             style: GoogleFonts.montserrat(
//                 fontFeatures: widget.fontFeatures,
//                 height: widget.height,
//                 decoration: widget.under == true
//                     ? TextDecoration.underline
//                     : widget.cut == true
//                     ? TextDecoration.lineThrough
//                     : TextDecoration.none,
//                 fontSize: widget.size2,
//                 color: widget.clr2 ?? ColorConstant.hintTextColor,
//                 fontWeight: widget.customWeight2 != null
//                     ? widget.customWeight2
//                     : widget.weight2 == null
//                     ? FontWeight.normal
//                     : widget.weight2 == "Bold"
//                     ? FontWeight.bold
//                     : widget.weight2 == "Semi Bold"
//                     ? FontWeight.w600
//                     : FontWeight.normal),
//           ),
//         ],
//       ),
//     );
//   }
// }
