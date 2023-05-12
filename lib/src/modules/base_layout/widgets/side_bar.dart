import 'package:flutter/material.dart';

import '../../../core/enums/menu_enum.dart';
import '../../../core/extensions/size_extension.dart';
import 'side_bar_menu_item.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  MenuEnum? selectedMenu;
  var collapsed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.bounceInOut,
      width: collapsed ? 90 : context.percentWidth(.18),
      height: double.infinity,
      child: Column(
        children: [
          Align(
            alignment: collapsed ? Alignment.center : Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                setState(() {
                  collapsed = !collapsed;
                });
              },
              icon: Icon(
                collapsed ? Icons.keyboard_double_arrow_right : Icons.keyboard_double_arrow_left,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            itemCount: MenuEnum.values.length,
            itemBuilder: (context, index) {
              final menu = MenuEnum.values[index];

              return SideBarMenuItem(
                menu: menu,
                selectedMenu: selectedMenu,
                onPressed: (value) {
                  setState(() {
                    selectedMenu = value;
                  });
                },
              );
            },
          )
        ],
      ),
    );
  }
}
