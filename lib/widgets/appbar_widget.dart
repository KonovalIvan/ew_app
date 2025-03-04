import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    this.leftIcon,
    this.rightIconMenu,
    this.title,
    this.onRightIconPressed,
  }) : super(key: key);

  final Widget? leftIcon;
  final Widget? rightIconMenu;
  final Text? title;
  final VoidCallback? onRightIconPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  // ignore: library_private_types_in_public_api
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  //FIXME: Fix size of back arrow
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: widget.title,
      backgroundColor: Colors.transparent,
      leading: widget.leftIcon != null
          ? widget.leftIcon!
          : const SizedBox(
              width: 0,
              height: 0,
            ),
      actions: [
        widget.rightIconMenu != null
            ? IconButton(
                icon: widget.rightIconMenu!,
                onPressed: () {
                  if (widget.onRightIconPressed != null) {
                    widget.onRightIconPressed!();
                  }
                },
              )
            : const SizedBox(
                width: 0,
                height: 0,
              ),
      ],
    );
  }
}
