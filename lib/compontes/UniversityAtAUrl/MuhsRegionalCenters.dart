import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../../../Utils/constantUrl.dart';


class MuhsRegionalCenters extends StatelessWidget {
  const MuhsRegionalCenters({super.key});

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold( 
      url: MyUrl.collageinformation ,
     
      

    ); 
  }
}