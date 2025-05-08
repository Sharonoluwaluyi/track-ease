import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CupertinoPickerBottomSheet extends HookWidget {
  final List<String> items;
  final String title;
  final String? suffix;
  final ValueChanged<String> onSelected;
  final double heightFactor;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? primaryColor;

  const CupertinoPickerBottomSheet({
    super.key,
    required this.items,
    required this.title,
    required this.onSelected,
    this.suffix,
    this.heightFactor = 0.4,
    this.backgroundColor,
    this.textColor,
    this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedIndex = useState(0);

    return Container(
      height: MediaQuery.of(context).size.height * heightFactor,
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          // Header
          _PickerHeader(
            title: title,
            onCancel: () => Navigator.pop(context),
            onConfirm: () {
              onSelected(items[selectedIndex.value]);
            },
            primaryColor: primaryColor ?? theme.primaryColor,
          ),
          
          // Picker
          Expanded(
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(
                initialItem: selectedIndex.value,
              ),
              itemExtent: 40,
              onSelectedItemChanged: (index) => selectedIndex.value = index,
              children: items.map((item) {
                return Center(
                  child: Text(
                    suffix != null ? "$item $suffix" : item,
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor ?? theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _PickerHeader extends StatelessWidget {
  final String title;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final Color primaryColor;

  const _PickerHeader({
    required this.title,
    required this.onCancel,
    required this.onConfirm,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onCancel,
            child: Text(
              'Cancel',
              style: TextStyle(color: primaryColor),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onConfirm,
            child: Text(
              'Done',
              style: TextStyle(color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

