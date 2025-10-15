import 'package:flutter/material.dart';
import 'package:neoterra/views/base/custom_app_bar.dart';
import 'package:neoterra/views/base/custom_button.dart';
import 'package:neoterra/views/base/custom_text_field.dart';
import 'package:neoterra/views/base/profile_picture.dart';

class UserProfileUserInformation extends StatefulWidget {
  const UserProfileUserInformation({super.key});

  @override
  State<UserProfileUserInformation> createState() =>
      _UserProfileUserInformationState();
}

class _UserProfileUserInformationState
    extends State<UserProfileUserInformation> {
  final nameCtrl = TextEditingController();
  final bioCtrl = TextEditingController();
  final instaCtrl = TextEditingController();
  final tiktokCtrl = TextEditingController();

  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: isEditing ? "Edit Profile" : "Profile UserInformation",
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              spacing: 16,
              children: [
                const SizedBox(height: 20),
                ProfilePicture(
                  image: "https://thispersondoesnotexist.com",
                  isEditable: isEditing,
                ),
                const SizedBox(),
                CustomTextField(
                  title: "Name",
                  controller: nameCtrl,
                  isDisabled: !isEditing,
                ),
                if (!isEditing) CustomTextField(title: "Email"),
                CustomTextField(
                  title: "Bio",
                  controller: bioCtrl,
                  isDisabled: !isEditing,
                ),
                CustomTextField(
                  title: "Instagram Url",
                  controller: instaCtrl,
                  isDisabled: !isEditing,
                ),
                CustomTextField(
                  title: "Tiktok Url",
                  controller: tiktokCtrl,
                  isDisabled: !isEditing,
                ),
                const SizedBox(),
                CustomButton(
                  onTap: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                  text: isEditing ? "Save Changes" : "Edit Profile",
                  leading: isEditing ? null : "assets/icons/edit.svg",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
