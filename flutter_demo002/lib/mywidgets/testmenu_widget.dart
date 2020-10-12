



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Menu {
  String name;
  Function(Menu menu, BuildContext context) onClick;

  Menu({this.name, this.onClick});
}

///
/// 可以快速的添加一个菜单的控件
///
class MenuWidget extends StatefulWidget {

  final List menus;

  MenuWidget({this.menus});

  @override
  State<StatefulWidget> createState() {
    return _MenuWidgetState();
  }

}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {

    return ListView.builder(itemBuilder: (context, index){
      return _buildItem(widget.menus[index], context);
    },
      itemCount: widget.menus.length,


    );

  }

  Widget _buildItem(Menu menu, BuildContext context) {
    return GestureDetector(
      child: ListTile(
        title: Text(menu.name),
      ),
      onTap: () {
        menu.onClick?.call(menu, context);
//        menu.onClick(menu, context);
      },
    );

  }

}
