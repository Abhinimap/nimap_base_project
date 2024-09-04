import 'package:flutter/material.dart';

import 'package:starter_template_get_x/presentation/presentation.dart';
import 'package:starter_template_get_x/data/data.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.appBar,
    required this.selectedDrawerElement,
    this.body,
    this.addSafeArea = false,
    this.top = true,
    this.bottom = true,
    this.right = true,
    this.left = true,
  });

  final PreferredSizeWidget? appBar;
  final DrawerElements selectedDrawerElement;
  final Widget? body;
  final bool addSafeArea;

  // NOTE: Only after addSafeArea is true following 4 parameters will work
  final bool top;
  final bool bottom;
  final bool right;
  final bool left;

  @override
  Widget build(BuildContext context) {
    if (addSafeArea) {
      return SafeArea(
        top: top,
        bottom: bottom,
        right: right,
        left: left,
        child: Scaffold(
          appBar: appBar,
          drawer: CustomDrawer(
            selectDrawerElement: selectedDrawerElement,
          ),
          body: body,
        ),
      );
    } else {
      return Scaffold(
        appBar: appBar,
        drawer: CustomDrawer(
          selectDrawerElement: selectedDrawerElement,
        ),
        body: body,
      );
    }
  }
}
