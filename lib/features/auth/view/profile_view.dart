import 'dart:io';

import 'package:app_food/core/constants/app_color.dart';
import 'package:app_food/core/localization/app_localizations.dart';
import 'package:app_food/core/localization/locale_cubit.dart';
import 'package:app_food/features/Order_CheckOut/widget/custom_list_titel.dart';
import 'package:app_food/features/auth/cubit/auth_cubit.dart';
import 'package:app_food/features/auth/data/user_model.dart';
import 'package:app_food/features/auth/view/login_view.dart';
import 'package:app_food/features/auth/view/widget/custom_text_form_feild_profile.dart';
import 'package:app_food/features/shared/no_internet_widget.dart';
import 'package:app_food/features/shared/shimmer_widgets.dart';
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
    final l10n = AppLocalizations.of(context);
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
              child: GestureDetector(
                onTap: () => _showSettingsSheet(context),
                child: SvgPicture.asset(
                  "assets/icons/settings.svg",
                  color: Colors.white,
                ),
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
                return const ProfileShimmer();
              } else if (state is AuthFailure) {
                final error = state.error;
                if (_isNoInternet(error)) {
                  return NoInternetWidget(
                    onRetry: () => context.read<AuthCubit>().getProfileData(),
                  );
                }
                return Center(
                  child: Text(
                    error,
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
                                  user?.name != null && user!.name.isNotEmpty
                                      ? user!.name[0].toUpperCase()
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
                        text: l10n.tr('profile_name'),
                      ),
                      const Gap(20),
                      CustomTextFormFieldProfile(
                        textEditingController: email,
                        text: l10n.tr('profile_email'),
                      ),
                      const Gap(20),
                      CustomTextFormFieldProfile(
                        textEditingController: deliveryAddress,
                        text: l10n.tr('profile_address'),
                      ),
                      const Gap(20),
                      CustomTextFormFieldProfile(
                        textEditingController: password,
                        text: l10n.tr('profile_password'),
                      ),
                      const Gap(25),
                      const Divider(color: Colors.white),
                      const Gap(25),
                      CustomListTitel(
                        tileColor: const Color(0xffF3F4F6),
                        activeColor: Colors.transparent,
                        title: l10n.tr('profile_debit_card'),
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
                  text: l10n.tr('profile_edit'),
                  icon: Icons.edit,
                  onTap: () {
                    context.read<AuthCubit>().updateProfileData(
                      name: name.text,
                      email: email.text,
                      address: deliveryAddress.text,
                      imagePath: pickedImage?.path,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.tr('profile_updated'))),
                    );
                  },
                ),
              ),
              const SizedBox(width: 20),

              // 🔹 زر خروج
              Expanded(
                child: CustomButtomSheetProfile(
                  text: l10n.tr('profile_logout'),
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

extension _ProfileViewLanguageSheet on _ProfileViewState {
  void _showSettingsSheet(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: Text(l10n.tr('language_sheet_title')),
                onTap: () {
                  Navigator.pop(ctx);
                  _showLanguageSheet(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: Text(
                  l10n.tr('profile_logout'),
                  style: const TextStyle(color: Colors.red),
                ),
                onTap: () async {
                  Navigator.pop(ctx);
                  await context.read<AuthCubit>().logout();
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  void _showLanguageSheet(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final currentCode = context.read<LocaleCubit>().state.languageCode;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    l10n.tr('language_sheet_title'),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                _buildLanguageTile(
                  ctx,
                  code: 'ar',
                  title: l10n.tr('language_ar'),
                  currentCode: currentCode,
                ),
                _buildLanguageTile(
                  ctx,
                  code: 'en',
                  title: l10n.tr('language_en'),
                  currentCode: currentCode,
                ),
                _buildLanguageTile(
                  ctx,
                  code: 'de',
                  title: l10n.tr('language_de'),
                  currentCode: currentCode,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageTile(
    BuildContext context, {
    required String code,
    required String title,
    required String currentCode,
  }) {
    final isSelected = currentCode == code;
    return ListTile(
      leading: Icon(
        Icons.language,
        color: isSelected ? AppColor.primary : Colors.grey,
      ),
      title: Text(title),
      trailing: isSelected
          ? const Icon(Icons.check, color: AppColor.primary)
          : null,
      onTap: () {
        context.read<LocaleCubit>().changeLocale(code);
        Navigator.pop(context);
      },
    );
  }
}

bool _isNoInternet(String message) {
  final lower = message.toLowerCase();
  return lower.contains('connection timeout') ||
      lower.contains('internet connection') ||
      lower.contains('failed host lookup') ||
      lower.contains('no internet');
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
