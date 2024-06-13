// App Page
// This page displays the app name, the site name, and the system information.
// The system information is obtained from the SystemInfo class.
// June 12, 2024
// Bill Banks  office@ourweb.net

import 'package:flutter/material.dart';
import 'package:web2mobile/Config.dart';
import 'package:web2mobile/Helpers/System_Info.dart';


class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage>  {
//   String systemInfo  = await  SystemInfo.getDeviceInfo();

  String systemInfo = '';

  @override
  void initState() {
    super.initState();
    SystemInfo().getDeviceInfo().then((value) {
      setState(() {
        systemInfo = value;
      });
    });
  }

 @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('App Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              sitename,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text( siteTitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              'System Info: $systemInfo',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        )
      ),
    );
  }
}