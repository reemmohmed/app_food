import 'package:app_food/core/constants/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_food/features/shared/titel_text_widget.dart';
import 'package:gap/gap.dart';

class ToppingDetelse extends StatelessWidget {
  const ToppingDetelse({
    super.key,
    required this.imagepath,
    required this.titel,
    this.onTap,
  });
  final String imagepath;
  final String titel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // الجزء البني (في الخلف)
        Container(
          width: 88,
          height: 61,
          decoration: const BoxDecoration(
            color: AppColor.primary,
            // color: Color(0xff3C2F2F),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),

            boxShadow: [
              BoxShadow(
                color: Colors.grey, // لون الظل
                blurRadius: 8, // درجة التمويه
                spreadRadius: 1, // مدى الانتشار
                offset: Offset(0, 4), // اتجاه الظل (يمين-يسار, فوق-تحت)
              ),
            ],
          ),

          padding: const EdgeInsets.only(left: 2),
          // titel , icon
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TitelTextWidget(
                  text: titel,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
              // Gap(15),
              Expanded(
                child: CircleAvatar(
                  backgroundColor: Color(0xffEF2A39),
                  radius: 12,
                  child: GestureDetector(
                    onTap: onTap,
                    child: Icon(
                      CupertinoIcons.add,

                      color: Color(0xffFFFFFF),

                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // الكارت الأبيض (فوق البني)
        Positioned(
          top: -44, // يرفع الأبيض فوق البني شويه
          left: 0,
          right: 0,
          child: Container(
            width: 88,
            height: 61,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0xff00000026), width: 1),
              color: Colors.white,
              boxShadow: [
                // ظل ناعم من فوق
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  offset: const Offset(0, -3),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
                // ظل خفيف من اليمين
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  offset: const Offset(3, 0),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
                // ظل خفيف من الشمال
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  offset: const Offset(-3, 0),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ],
            ),
            // shadow image
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    // ظل ناعم أسفل الصورة فقط
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      offset: const Offset(0, 4),
                      blurRadius: 5,
                      spreadRadius: -9,
                    ),
                  ],
                ),
                child: Image.asset(
                  imagepath,
                  width: 55,
                  height: 45.91,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
