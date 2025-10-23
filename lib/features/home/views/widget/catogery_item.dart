import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/shared/titel_text_widget.dart';
import 'package:flutter/material.dart';

class CatogeryItem extends StatefulWidget {
  const CatogeryItem({super.key, required this.catogetry, required this.selectIndex});
  final List catogetry;
  final int selectIndex; 
  @override
  State<CatogeryItem> createState() => _CatogeryItemState();
}

class _CatogeryItemState extends State<CatogeryItem> {
  late int selectIndex;
  @override
  void initState() {
    super.initState();
    selectIndex = widget.selectIndex;
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(widget.catogetry.length, (index) {
            return GestureDetector(
              onTap: () => setState(() {
                selectIndex = index;
              }),

              child: Container(
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: selectIndex == index
                      ? AppColor.primary
                      : Color(0xffF3F4F6),
                ),
                child: TitelTextWidget(
                  text:widget. catogetry[index],
                  color: selectIndex == index
                      ? Colors.white
                      : Color(0xff6A6A6A),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
