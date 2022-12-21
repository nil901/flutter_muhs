import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';  
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:path_provider_ex/path_provider_ex.dart';

class PdfView extends StatelessWidget {
  String name = "";
  String pathPDF = "";
  PdfView({required this.pathPDF ,required this.name});
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
         backgroundColor: HexColor('#074372'), 
         centerTitle: true,
        title:  Text(name)
      ),
      body: SfPdfViewer.network(
        pathPDF,
        key: _pdfViewerKey,
      ),
    );
  }
}
