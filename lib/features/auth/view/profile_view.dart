import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/Order_CheckOut/widget/custom_list_titel.dart';
import 'package:app_food/features/auth/view/widget/custom_text_form_feild_profile.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController deliveryAddress = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColor.primary,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.primary,

          scrolledUnderElevation: 0,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                "assets/icons/settings.svg",
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&fm=jpg&q=60&w=3000",
                      ),
                    ),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey,
                    border: BoxBorder.all(color: Colors.white, width: 2),
                  ),
                ),
                Gap(20),
                CustomTextFormFieldProfile(
                  textEditingController: name,
                  text: "name",
                ),
                Gap(20),
                CustomTextFormFieldProfile(
                  text: "email",
                  textEditingController: email,
                ),
                Gap(20),
                CustomTextFormFieldProfile(
                  text: "deliveryAdress",
                  textEditingController: deliveryAddress,
                ),
                Gap(20),
                CustomTextFormFieldProfile(
                  text: "password",
                  textEditingController: password,
                ),
                Gap(25),
                Divider(),
                Gap(25),
                CustomListTitel(
                  tileColor: Color(0xffF3F4F6),
                  activeColor: Colors.transparent,
                  title: "Debit card",
                  titelcolor: Colors.black,
                  sub: "3566 **** **** 0505",
                  iconPath: "assets/icons/visa.png",
                  value: "cash",
                  groupValue: "cash",
                  onChanged: (value) {},
                ),
                Gap(200),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          height: 120,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.shade100)],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // توزيع الزرين بالتساوي
            children: [
              // 🔹 زر تعديل (Edit)
              Expanded(
                child: CustomButtomSheetProfile(
                  text: 'Edit',
                  icon: Icons.edit,
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 20),

              // 🔹 زر خروج (Logout)
              Expanded(
                child: CustomButtomSheetProfile(
                  text: 'Log out',
                  icon: Icons.output_sharp,
                  iconColor: Colors.red,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButtomSheetProfile extends StatelessWidget {
  const CustomButtomSheetProfile({
    super.key,
    this.onTap,
    required this.text,
    required this.icon,
    this.iconColor,
  });
  final Function()? onTap;
  final String text;
  final IconData icon;
  final Color? iconColor;
  // is select contaiver
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.primary,
          border: Border.all(width: 2, color: Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SubtitelTextWidget(
              text: text,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            Gap(20),
            Icon(icon, size: 25, color: iconColor ?? Colors.white),
          ],
        ),
      ),
    );
  }
}
