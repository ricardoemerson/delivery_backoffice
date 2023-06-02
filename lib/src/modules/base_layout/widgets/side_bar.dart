import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/enums/menu_enum.dart';
import '../../../core/extensions/size_extension.dart';
import '../../../core/mixins/history_back_listener_mixin.dart';
import 'side_bar_menu_item.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with HistoryBackListenerMixin {
  MenuEnum? selectedMenu;
  var collapsed = false;

  @override
  void initState() {
    super.initState();

    selectedMenu = MenuEnum.findByPath(Modular.to.path);
  }

  @override
  void onHistoryBack(Event event) {
    setState(() {
      selectedMenu = MenuEnum.findByPath(Modular.to.path);
    });
  }

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
                    Modular.to.navigate(value.route);
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
