import 'package:flutter/material.dart';

class BaseToastWidget extends StatelessWidget {
  const BaseToastWidget({
    Key? key,
    required this.color,
    required this.icon,
    required this.message,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            message,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
