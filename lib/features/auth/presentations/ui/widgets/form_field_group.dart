import 'package:flutter/material.dart';

import '../../../../../core/theme/app_spacing.dart';
import 'auth_text_field.dart';

class FormFieldGroup extends StatelessWidget {
  final List<String> fields;

  const FormFieldGroup({super.key, required this.fields});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      for (var index = 0; index < fields.length; index++) ...[
        if (index != 0) const SizedBox(height: AppSpacing.sectionGap),
        AuthTextField(
          label: fields[index],
          keyboardType: fields[index].toLowerCase().contains('email')
              ? TextInputType.emailAddress
              : null,
          obscureText: fields[index].toLowerCase().contains('password'),
        ),
      ],
    ],
  );
}
