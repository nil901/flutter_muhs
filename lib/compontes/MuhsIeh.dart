 
 import 'package:flutter/material.dart';
import 'package:flutter_muhs/Utils/constantUrl.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart'; 


 class Muhsleh extends StatelessWidget {
  const Muhsleh({super.key});

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold( 
      url: MyUrl.muhsieh ,
     
      

    ); 
  }
}