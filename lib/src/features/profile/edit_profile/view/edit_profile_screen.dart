
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../global/constants/app_strings.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/constants/input_decoration.dart';
import '../../../../global/global_widget/global_bottom_widget.dart';
import '../../../../global/global_widget/global_sized_box.dart';
import '../../../../global/global_widget/global_text.dart';
import '../../../../global/global_widget/global_textform_field.dart';
import '../controller/edit_profile_controller.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          sizedBoxH(20),
                          GlobalTextFormField(
                            controller: controller.nameController,
                            titleText: AppStrings.fullName,
                            hintText: AppStrings.issueTitle,
                            fillColor: ColorRes.white,
                            filled: true,
                            decoration: borderDecoration,
                            validator: controller.validateName,
                          ),
                          sizedBoxH(15),
                          Row(
                            children: [
                              Expanded(
                                child: GlobalTextFormField(
                                  controller: controller.genderController,
                                  titleText: AppStrings.gender,
                                  hintText: AppStrings.issueTitle,
                                  fillColor: ColorRes.white,
                                  filled: true,
                                  decoration: borderDecoration,
                                ),
                              ),
                              sizedBoxW(15),
                              Expanded(
                                child: GlobalTextFormField(
                                  controller: controller.dobController,
                                  titleText: AppStrings.dateOfBirth,
                                  hintText: AppStrings.issueTitle,
                                  fillColor: ColorRes.white,
                                  filled: true,
                                  decoration: borderDecoration,
                                ),
                              ),
                            ],
                          ),
                          sizedBoxH(15),
                          GlobalTextFormField(
                            controller: controller.emailController,
                            titleText: AppStrings.emailAddress,
                            hintText: AppStrings.issueTitle,
                            fillColor: ColorRes.white,
                            filled: true,
                            decoration: borderDecoration,
                            validator: controller.validateEmail,
                          ),
                          sizedBoxH(15),
                          GlobalTextFormField(
                            controller: controller.phoneController,
                            titleText: AppStrings.phone,
                            hintText: AppStrings.issueTitle,
                            fillColor: ColorRes.white,
                            filled: true,
                            decoration: borderDecoration,
                            validator: controller.validatePhone,
                          ),
                          sizedBoxH(15),
                          GlobalTextFormField(
                            controller: controller.nidController,
                            titleText: AppStrings.nationalIdNo,
                            hintText: AppStrings.issueTitle,
                            fillColor: ColorRes.white,
                            filled: true,
                            decoration: borderDecoration,
                          ),
                          sizedBoxH(30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GlobalButtonWidget(
              str: AppStrings.saveChanges,
              onTap: () => controller.saveChanges(),
              buttomColor: ColorRes.appButtonColor,
              textColor: ColorRes.white,
              radius: 30,
              height: 55,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Background Image
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.appImages.sellerBackImg.path),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.3),
                  Colors.black.withValues(alpha: 0.7),
                ],
              ),
            ),
          ),
        ),
        
        // Back Button
        Positioned(
          top: 40,
          left: 10,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
            onPressed: () => Get.back(),
          ),
        ),

        // Camera Icon top right
        Positioned(
          top: 40,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 20),
          ),
        ),

        // Profile Info
        Positioned(
          bottom: 20,
          left: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.7),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                      child: const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 14),
                    ),
                  ),
                ],
              ),
              sizedBoxW(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GlobalText(
                    str: "Micheal Thomas",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  const GlobalText(
                    str: "tanvirchowdhury123@gmail.com",
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                  sizedBoxH(5),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
