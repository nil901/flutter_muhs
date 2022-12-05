 
 import 'package:flutter/material.dart';
import 'package:flutter_muhs/Utils/constantUrl.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart'; 


 class Manas extends StatelessWidget {
  const Manas({super.key});

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold( 
      url: MyUrl.manasmitra ,
     
      

    ); 
  }
}