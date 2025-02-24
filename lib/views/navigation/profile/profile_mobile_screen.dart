import '../../../controller/navigation/profile_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/profile/profile_info_widget.dart';
import '../../../widgets/profile/profile_input_filed.dart';

class ProfileMobileScreenLayout extends StatelessWidget {
  const ProfileMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        verticalSpace(Dimensions.heightSize*2),
        ProfileInfoWidget(controller: controller),
        verticalSpace(Dimensions.heightSize),
        UpdateProfileFieldsWidget(controller: controller),
         DeleteButton(),
      ],
    );
  }
}
