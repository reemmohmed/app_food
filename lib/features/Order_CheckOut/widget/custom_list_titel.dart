import "package:app_food/features/shared/subtitel_widget.dart";
import "package:app_food/features/shared/titel_text_widget.dart";
import "package:flutter/material.dart";

class CustomListTitel extends StatelessWidget {
  const CustomListTitel({
    super.key,
    required this.title,
    this.sub = "",
    required this.iconPath,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.tileColor = const Color(0xff3C2F2F),
    this.borderRadius = 16,
    this.titelcolor = Colors.white,
    this.activeColor = Colors.green,
    this.textColor = Colors.white,
    this.elevation = 8,
  });
  final String title;
  final String sub;
  final String iconPath;
  final String value;
  final Color titelcolor;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  final Color tileColor;
  final Color textColor;
  final Color activeColor;
  final double borderRadius;
  final double elevation;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      shadowColor: Color(0xffF3F4F6), // لون الظل
      borderRadius: BorderRadius.circular(16),
      child: ListTile(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        tileColor: tileColor,
        leading: Image.asset(iconPath),

        title: TitelTextWidget(text: title, color: titelcolor),
        subtitle: sub.isNotEmpty ? SubtitelTextWidget(text: sub) : null,
        // subtitle: SubtitelTextWidget(text: sub),
        trailing: Radio<String>(
          activeColor: activeColor,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        dense: sub.isEmpty,
      ),
    );
  }
}
