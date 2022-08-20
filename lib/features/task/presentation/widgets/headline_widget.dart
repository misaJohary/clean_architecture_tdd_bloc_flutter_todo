import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class HeadlineWidget extends StatelessWidget {
  const HeadlineWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        'What\'s Up !',
        style: Theme.of(context)
            .textTheme
            .headline3!
            .copyWith(color: strong, fontFamily: 'DancingScript'),
      ),
    );
  }
}
