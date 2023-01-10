 
 import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewAppliedForms extends StatelessWidget { 
  String webViewName = "" ;
 WebViewAppliedForms({super.key, required this.webViewName});

  @override
  Widget build(BuildContext context) {
     return WebviewScaffold( 
      url: webViewName
     
      

    ); 
  }
}
  