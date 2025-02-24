import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/send_money/receiving_method_widget_screen.dart';

class ReceivingMethodTabScreen extends StatelessWidget {
  const ReceivingMethodTabScreen({
    super.key,
  });
  @override         
  Widget build(BuildContext context) {   
    return Scaffold(
      backgroundColor: CustomColor.primaryLightColor,
      appBar: AppBar(
        surfaceTintColor: CustomColor.whiteColor.withValues(alpha:0.15),
        centerTitle: true,
        leadingWidth: MediaQuery.sizeOf(context).width * 0.1,
        leading: BackButtonWidget(
            iconBgColor: CustomColor.whiteColor.withValues(alpha:0.15),
            onTap: () {
              Get.close(1);
            }),
        toolbarHeight: Dimensions.heightSize * 5,
        backgroundColor:CustomColor.primaryLightColor,
        title: TitleHeading3Widget(
            fontSize: Dimensions.headingTextSize3 * 2,
            color: CustomColor.whiteColor,
            text: Strings.receivingMethod),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      margin:EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal*1.2
      ),
      child: ReceivingMethodWidget());
  }
}
