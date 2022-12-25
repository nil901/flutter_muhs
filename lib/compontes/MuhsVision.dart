
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

 

// class MuhsVision extends StatefulWidget {
//   const MuhsVision({super.key});

//   @override
//   State<MuhsVision> createState() => _MuhsVisionState();
// }

// class _MuhsVisionState extends State<MuhsVision> {
  
//   @override
//   Widget build(BuildContext context) {
//     return WebviewScaffold( 
//       url: "https://googleflutter.com/" ,
//       appBar: AppBar( 
//        backgroundColor: HexColor('#074372'),
//        centerTitle: true,
//         leading: Icon(Icons.arrow_back), 
//         title: Text("MUSH Vision") ,
//       ),

//     ); 
    
//   }
// } 


class MuhsVision extends StatelessWidget {

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: HexColor('#074372'),
          centerTitle: true,
          title: Text("MUHS Vision")),
      body: SfPdfViewer.network(
         "https://admin.muhs.wowinfotech.co/Images/MUHS_VISION_DOCUMENT.pdf",
        key: _pdfViewerKey,
      ),
    );
  }
}
