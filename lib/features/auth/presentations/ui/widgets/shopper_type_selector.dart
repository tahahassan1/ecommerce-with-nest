import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../domain/entities/shopper_profile.dart';

class ShopperTypeSelector extends StatelessWidget {
  final ShopperType value;
  final ValueChanged<ShopperType> onChanged;

  const ShopperTypeSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: _Choice(
          label: 'Men',
          selected: value == ShopperType.men,
          onTap: () => onChanged(ShopperType.men),
        ),
      ),
      const SizedBox(width: AppSpacing.sectionGap),
      Expanded(
        child: _Choice(
          label: 'Women',
          selected: value == ShopperType.women,
          onTap: () => onChanged(ShopperType.women),
        ),
      ),
    ],
  );
}

class _Choice extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _Choice({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
    height: AppSpacing.buttonHeight,
    child: FilledButton(
      onPressed: onTap,
      style: FilledButton.styleFrom(
        backgroundColor: selected ? AppColors.primary : AppColors.surface,
        foregroundColor: selected ? AppColors.white : AppColors.textPrimary,
        shape: const StadiumBorder(),
      ),
      child: Text(label),
    ),
  );
}
