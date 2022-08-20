import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.actions,
    this.onPressed,
    this.leading,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  final String? title;
  final VoidCallback? onPressed;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title ?? ''),
      leading: widget.leading ??
          IconButton(
            onPressed: widget.onPressed ??
                () {
                  Navigator.pop(context);
                },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
      actions: widget.actions ?? [],
    );
  }
}
