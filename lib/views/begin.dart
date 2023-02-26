import 'package:flutter/material.dart';

import 'desktop_begin.dart';
import 'mobile_begin.dart';

class Begin extends StatefulWidget {
  const Begin({Key? key}) : super(key: key);

  @override
  State<Begin> createState() => _BeginState();
}

class _BeginState extends State<Begin> {

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    final theme = Theme.of(context);
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isSmallScreen) const DesktopBegin(),
              if(isSmallScreen)const MobileBegin()
            ],
      ),
    );
  }
}







