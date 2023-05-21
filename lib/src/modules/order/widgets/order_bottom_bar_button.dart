import 'package:flutter/material.dart';

import '../../../core/extensions/app_text_styles_extension.dart';

class OrderBottomBarButton extends StatelessWidget {
  final String label;
  final String image;
  final Color color;
  final BorderRadius borderRadius;

  const OrderBottomBarButton({
    super.key,
    required this.label,
    required this.image,
    required this.color,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
            side: BorderSide(color: color),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(image),
              const SizedBox(width: 5),
              Text(
                label,
                style: context.textStyles.textBold.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
