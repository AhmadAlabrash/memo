import '../others/image_picker_sheet.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../controller/navigation/profile_controller.dart';
import '../../utils/basic_widget_imports.dart';
import '../drawer/image_picker.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key, required this.controller});
  final ProfileController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Animate(
          effects: const [FadeEffect(), ScaleEffect()],
          child: Obx(
         ()=> ImagePickerWidget(
              isPicker: true,
              isImagePathSet: controller.isImagePathSet.value,
              imagePath: controller.userImagePath.value,
              imageUrl: controller.userImage.value,
              onImagePick: () {
                _showImagePickerBottomSheet(context);
              },
            ),
          ),
        ),
      ],
    );
  }

  _showImagePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: double.infinity,
          child: ImagePickerSheet(
            fromCamera: () {
              Get.back();
              controller.chooseImageFromCamera();
            },
            fromGallery: () {
              Get.back();
              controller.chooseImageFromGallery();
            },
          ),
        );
      },
    );
  }
}
