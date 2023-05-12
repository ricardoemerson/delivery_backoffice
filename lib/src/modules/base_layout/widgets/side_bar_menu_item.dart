import 'package:flutter/material.dart';

import '../../../core/enums/menu_enum.dart';
import '../../../core/extensions/app_text_styles_extension.dart';

class SideBarMenuItem extends StatelessWidget {
  final MenuEnum menu;
  final MenuEnum? selectedMenu;
  final ValueChanged<MenuEnum> onPressed;

  const SideBarMenuItem({
    super.key,
    required this.menu,
    this.selectedMenu,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedMenu == menu;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Visibility(
          visible: constraints.maxWidth != 90,
          replacement: Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            decoration: isSelected
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFF5E2),
                  )
                : null,
            child: Tooltip(
              message: menu.label,
              preferBelow: true,
              child: IconButton(
                onPressed: () => onPressed(menu),
                padding: EdgeInsets.zero,
                icon: Image.asset(
                  'assets/images/icons/${isSelected ? menu.selectedIcon : menu.icon}',
                ),
              ),
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onPressed(menu),
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: isSelected
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFFFF5E2),
                      )
                    : null,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/icons/${isSelected ? menu.selectedIcon : menu.icon}',
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        menu.label,
                        overflow: TextOverflow.ellipsis,
                        style: isSelected
                            ? context.textStyles.textBold
                            : context.textStyles.textRegular,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
