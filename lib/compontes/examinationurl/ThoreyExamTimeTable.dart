 
 import 'package:flutter/material.dart';
import 'package:flutter_muhs/Utils/constantUrl.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart'; 


 class ThoreyExamTimeTable extends StatelessWidget {
  const ThoreyExamTimeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold( 
      url: MyUrl.TheoryExamTimeTbale ,
     
      

    ); 
  }
}