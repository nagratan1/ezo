
import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonVisible;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.isBackButtonVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      
      backgroundColor: Color(0xff310096),
      title: Text(title,style: TextStyle(color: Colors.white),),
      centerTitle: true,
      leading: isBackButtonVisible
          ? BackButton()
          : IconButton(
              icon: Icon(Icons.menu,color: Colors.white,),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Opens the drawer
              },
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}