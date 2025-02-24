import 'dart:io';
import '../../controller/send_money/payment_manual_controller.dart';
import '/widgets/text_labels/custom_title_heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../../language/english.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/size.dart';
import 'snackbar.dart';

File? imageFile;

class ProofImagePickerWidget extends StatefulWidget {
  const ProofImagePickerWidget({
    super.key,
    required this.labelName,
    required this.fieldName,
  });

  final String labelName;
  final String fieldName;

  @override
  State<ProofImagePickerWidget> createState() =>
      _OfferEvidenceImagePickerWidgetState();
}

class _OfferEvidenceImagePickerWidgetState
    extends State<ProofImagePickerWidget> {
  final controller = Get.put(PaymentManualController());

  Future pickImage(imageSource) async {
    try {
      final image =
          await ImagePicker().pickImage(source: imageSource, imageQuality: 50);
      if (image == null) return;

      imageFile = File(image.path);

      if (controller.listFieldName.isNotEmpty) {
        if (controller.listFieldName.contains(widget.fieldName)) {
          int itemIndex = controller.listFieldName.indexOf(widget.fieldName);
          controller.listFieldName[itemIndex] = widget.fieldName;
          controller.listImagePath[itemIndex] = imageFile!.path;
        } else {
          controller.listImagePath.add(imageFile!.path);
          controller.listFieldName.add(widget.fieldName);
        }
      } else {
        controller.listImagePath.add(imageFile!.path);
        controller.listFieldName.add(widget.fieldName);
      }
      setState(() {
        controller.updateImageData(widget.fieldName, imageFile!.path);
      });

      Get.back();
      CustomSnackBar.success('${widget.labelName} Added');
    } on PlatformException catch (e) {
      CustomSnackBar.error('Error: $e');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Theme.of(context).colorScheme.surface,
          builder: (context) => imagePickerBottomSheetWidget(context),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelName,
            style: CustomStyle.darkHeading4TextStyle.copyWith(
              fontSize: isTab()
                  ? Dimensions.headingTextSize3
                  : Dimensions.headingTextSize3,
              fontWeight: isTab() ? FontWeight.w600 : FontWeight.w500,
              color: CustomColor.inputLabelLightTextColor,
            ),
          ),
          verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
          Container(
            height: controller.getImagePath(widget.fieldName) == null
                ? MediaQuery.of(context).size.height * 0.15
                : MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
            decoration: BoxDecoration(
                color: CustomColor.inputFillLightTextColor,
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
                image: controller.getImagePath(widget.fieldName) == null
                    ? null
                    : DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(
                          File(
                            controller.getImagePath(widget.fieldName) ?? '',
                          ),
                        ),
                      )),
            child: controller.getImagePath(widget.fieldName) == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.cloud_upload_outlined,
                        color: CustomColor.inputHintLightTextColor,
                      ),
                      SizedBox(
                        width: Dimensions.widthSize * 0.5,
                      ),
                      CustomTitleHeadingWidget(
                        text: Strings.dropYouFileOrClickToSelect,
                        style: GoogleFonts.inter(
                          color: CustomColor.inputHintLightTextColor,
                          fontSize: Dimensions.headingTextSize4,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )
                : const Row(children: []),
          ),
        ],
      ),
    );
  }

  imagePickerBottomSheetWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.15,
      margin: EdgeInsets.all(Dimensions.marginSizeVertical * 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(Dimensions.paddingSize),
            child: IconButton(
                onPressed: () {
                  pickImage(ImageSource.gallery);
                },
                icon: Icon(
                  Icons.image,
                  color: Theme.of(context).primaryColor,
                  size: 50,
                )),
          ),
          Padding(
            padding: EdgeInsets.all(Dimensions.paddingSize),
            child: IconButton(
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
                icon: Icon(
                  Icons.camera,
                  color: Theme.of(context).primaryColor,
                  size: 50,
                )),
          ),
        ],
      ),
    );
  }
}
