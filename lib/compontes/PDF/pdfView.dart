// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
// import 'package:hexcolor/hexcolor.dart';

// class PdfView extends StatelessWidget {
//   const PdfView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(  
//       appBar: AppBar(
//           backgroundColor: HexColor('#074372'),
//           title: Text(
//             "Savitribai Phule Girls scholarship",
//             style: TextStyle(fontSize: 22),
//           ),
//           centerTitle: true,
//         ),

//       body: PDF(
//         enableSwipe: true,
//         //swipeHorizontal: true, 
        
//         autoSpacing: false,
//         pageFling: false,
//         onError: (error) {
//           print(error.toString());
//         },
//         onPageError: (page, error) {
//           print('$page: ${error.toString()}');
//         },
//         onPageChanged: (int page, int total) {
//           print('page change: $page/$total');
//         },
//       ).fromUrl('https://admin.muhs.wowinfotech.co/Images/Earn while learn.pdf'),
//     );
//   }
// }
