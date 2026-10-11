import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_assets.dart';
import '../../../../../core/theme/app_spacing.dart';

class AgeRangeField extends StatelessWidget {
  final String? value;
  final ValueChanged<String> onChanged;

  const AgeRangeField({super.key, this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) => DropdownButtonFormField<String>(
    initialValue: value,
    decoration: const InputDecoration(hintText: 'Age Range'),
    icon: SvgPicture.asset(AppAssets.iconsArrowDown),
    items: const [
      DropdownMenuItem(value: '18-24', child: Text('18-24')),
      DropdownMenuItem(value: '25-34', child: Text('25-34')),
      DropdownMenuItem(value: '35-44', child: Text('35-44')),
      DropdownMenuItem(value: '45+', child: Text('45+')),
    ],
    onChanged: (value) {
      if (value != null) onChanged(value);
    },
    borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
  );
}
