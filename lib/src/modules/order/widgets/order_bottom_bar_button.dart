import 'package:flutter/material.dart';

import '../../../core/extensions/app_text_styles_extension.dart';

class OrderBottomBarButton extends StatelessWidget {
  final String label;
  final String image;
  final Color color;
  final BorderRadius borderRadius;
  final VoidCallback? onPressed;

  const OrderBottomBarButton({
    super.key,
    required this.label,
    required this.image,
    required this.color,
    required this.borderRadius,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
            side: BorderSide(color: onPressed != null ? color : Colors.transparent),
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
