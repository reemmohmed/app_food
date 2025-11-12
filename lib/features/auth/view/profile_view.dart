import 'dart:io';

import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/features/Order_CheckOut/widget/custom_list_titel.dart';
import 'package:app_food/features/auth/cubit/auth_cubit.dart';
import 'package:app_food/features/auth/data/user_model.dart';
import 'package:app_food/features/auth/view/login_view.dart';
import 'package:app_food/features/auth/view/widget/custom_text_form_feild_profile.dart';
import 'package:app_food/features/shared/subtitel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

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

  UserModel? user;
  File? pickedImage;

  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getProfileData();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        pickedImage = File(pickedFile.path);
      });
      // هنا ممكن تبعتي الصورة للسيرفر بعد كده لو حبيتي
      // context.read<AuthCubit>().updateProfileImage(pickedImage!);
    }
  }

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
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                user = state.user;
                name.text = user?.name ?? '';
                email.text = user?.email ?? '';
                deliveryAddress.text = user?.address ?? 'No address set';

                password.text == "********" ? null : password.text;
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              } else if (state is AuthFailure) {
                return Center(
                  child: Text(
                    state.error,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const Gap(10),

                      // ✅ الصورة أو أول حرف من الاسم
                      GestureDetector(
                        onTap: _pickImage, // يفتح المعرض
                        child: pickedImage != null
                            ? CircleAvatar(
                                radius: 60,
                                backgroundImage: FileImage(pickedImage!),
                              )
                            : (user != null &&
                                  user!.image != null &&
                                  user!.image!.isNotEmpty)
                            ? CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(user!.image!),
                              )
                            : CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.white,
                                child: Text(
                                  user?.name != null && user!.name!.isNotEmpty
                                      ? user!.name![0].toUpperCase()
                                      : "?",
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primary,
                                  ),
                                ),
                              ),
                      ),
                      const Gap(20),
                      CustomTextFormFieldProfile(
                        textEditingController: name,
                        text: "Name",
                      ),
                      const Gap(20),
                      CustomTextFormFieldProfile(
                        textEditingController: email,
                        text: "Email",
                      ),
                      const Gap(20),
                      CustomTextFormFieldProfile(
                        textEditingController: deliveryAddress,
                        text: "Delivery Address",
                      ),
                      const Gap(20),
                      CustomTextFormFieldProfile(
                        textEditingController: password,
                        text: "Password",
                      ),
                      const Gap(25),
                      const Divider(color: Colors.white),
                      const Gap(25),
                      CustomListTitel(
                        tileColor: const Color(0xffF3F4F6),
                        activeColor: Colors.transparent,
                        title: "Debit card",
                        titelcolor: Colors.black,
                        sub: "3566 **** **** 0505",
                        iconPath: "assets/icons/visa.png",
                        value: "cash",
                        groupValue: "cash",
                        onChanged: (value) {},
                      ),
                      const Gap(200),
                    ],
                  ),
                );
              }
            },
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 🔹 زر تعديل
              Expanded(
                child: CustomButtomSheetProfile(
                  text: 'Edit',
                  icon: Icons.edit,
                  onTap: () {
                    context.read<AuthCubit>().updateProfileData(
                      name: name.text,
                      email: email.text,
                      address: deliveryAddress.text,
                      imagePath: pickedImage?.path,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Profile updated successfully"),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 20),

              // 🔹 زر خروج
              Expanded(
                child: CustomButtomSheetProfile(
                  text: 'Log out',
                  icon: Icons.output_sharp,
                  iconColor: Colors.red,
                  onTap: () async {
                    await context.read<AuthCubit>().logout();

                    if (!context.mounted) return; // ✅ تأكيد إن الودجت لسه موجود

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                      (route) => false,
                    );
                  },
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
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
            const Gap(20),
            Icon(icon, size: 25, color: iconColor ?? Colors.white),
          ],
        ),
      ),
    );
  }
}
