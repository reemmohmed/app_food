import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:app_food/features/shared/titel_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderCheckOutView extends StatelessWidget {
  const OrderCheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitelTextWidget(text: "Order summary", fontWeight: FontWeight.w600),
            Gap(12),
            CustomOrderSmall(titel: "Order", price: "133 \$"),
            Gap(12),

            CustomOrderSmall(titel: "Taxes", price: "0.3 \$"),
            Gap(12),

            CustomOrderSmall(titel: "Delivery fees", price: "1.5 \$"),
            Gap(12),
            Divider(),
            CustomOrderCapitl(price: "18.19\$", tital: "Total"),
            Gap(12),
            CustomOrderCapitl(
              price: "15 - 30 mins",
              fontSize: 14,
              tital: "Estimated delivery time:",
            ),
            Gap(50),
            CustomListTitel(
              title: "Cash on delivery",
              iconPath: "assets/icons/dollar.png",
              value: "cash",
              groupValue: "cash",
              onChanged: (value) {},
            ),
            Gap(20),
            CustomListTitel(
              tileColor: Colors.blue.shade300,
              activeColor: Colors.white,
              title: "Debit card",
              sub: "3566 **** **** 0505",
              iconPath: "assets/icons/visa.png",
              value: "cash",
              groupValue: "cash",
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}

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
    this.activeColor = Colors.green,
    this.textColor = Colors.white,
    this.elevation = 8,
  });
  final String title;
  final String sub;
  final String iconPath;
  final String value;
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
        title: TitelTextWidget(text: title, color: Colors.white),
        subtitle: SubtitelTextWidget(text: sub),
        trailing: Radio<String>(
          activeColor: activeColor,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class CustomOrderCapitl extends StatelessWidget {
  const CustomOrderCapitl({
    super.key,
    this.fontSize = 18,
    required this.tital,
    required this.price,
  });
  final double? fontSize;
  final String tital;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitelTextWidget(text: tital, fontSize: fontSize),
        TitelTextWidget(text: price, fontSize: fontSize),
      ],
    );
  }
}

class CustomOrderSmall extends StatelessWidget {
  const CustomOrderSmall({super.key, required this.titel, required this.price});
  final String titel;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SubtitelTextWidget(text: titel, color: Color(0xff7D7D7D)),
          SubtitelTextWidget(text: price, color: Color(0xff7D7D7D)),
        ],
      ),
    );
  }
}
