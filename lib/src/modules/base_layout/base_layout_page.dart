import 'package:flutter/material.dart';

import '../../core/extensions/size_extension.dart';
import 'widgets/side_bar.dart';

class BaseLayoutPage extends StatelessWidget {
  final Widget body;

  const BaseLayoutPage({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final shortestSide = context.screenShortestSide;

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SizedBox(
        height: context.screenHeight,
        child: Stack(
          children: [
            Container(
              color: Colors.black,
              alignment: Alignment.centerLeft,
              constraints: BoxConstraints(
                minWidth: screenWidth,
                minHeight: shortestSide * .15,
                maxHeight: shortestSide * .15,
              ),
              child: Container(
                width: shortestSide * .13,
                margin: const EdgeInsets.only(left: 60),
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            Positioned.fill(
              top: shortestSide * .13,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    const SideBar(),
                    Expanded(
                      child: ColoredBox(
                        color: Colors.grey[50]!,
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: body,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            // body
          ],
        ),
      ),
    );
  }
}
