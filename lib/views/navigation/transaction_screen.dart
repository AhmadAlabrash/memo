import '../../controller/navigation/transaction_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import 'transaction_mobile_screen.dart';

class TransactionScreen extends StatelessWidget {
  TransactionScreen({super.key});

  final controller = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      tabletScaffold: TransactionMobileScreen(
        controller: controller,
      ),
      mobileScaffold: TransactionMobileScreen(
        controller: controller,
      ),
    );
  }
}
