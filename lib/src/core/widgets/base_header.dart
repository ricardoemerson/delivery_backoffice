import 'package:flutter/material.dart';

import '../extensions/app_text_styles_extension.dart';

class BaseHeader extends StatelessWidget {
  final String title;
  final ValueChanged<String>? searchChanged;
  final String buttonLabel;
  final VoidCallback? buttonPressed;
  final bool addButton;
  final Widget? filterWidget;

  const BaseHeader({
    super.key,
    required this.title,
    this.searchChanged,
    required this.buttonLabel,
    this.buttonPressed,
    this.addButton = true,
    this.filterWidget,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Visibility(
                visible: filterWidget == null,
                replacement: filterWidget ?? const SizedBox.shrink(),
                child: SizedBox(
                  width: constraints.maxWidth * .15,
                  child: TextFormField(
                    onChanged: searchChanged,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: Icon(
                        Icons.search,
                        size: constraints.maxWidth * .02,
                      ),
                      label: Text(
                        'Buscar',
                        style: context.textStyles.textRegular.copyWith(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * .65,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: context.textStyles.textTitle.copyWith(
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                  ),
                ),
              ),
              Visibility(
                visible: addButton,
                child: SizedBox(
                  height: 48,
                  width: constraints.maxWidth * .15,
                  child: OutlinedButton.icon(
                    onPressed: buttonPressed,
                    icon: Icon(
                      Icons.add,
                      size: constraints.maxWidth * .02,
                    ),
                    label: Text(buttonLabel),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
