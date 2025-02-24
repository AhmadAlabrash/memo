import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import 'payment_preview_tab_screen.dart';
import 'payment_preview_mobile_screen.dart';

class PaymentPreviewScreen extends StatelessWidget {
  const PaymentPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      tabletScaffold: PaymentPreviewTabScreen(),
      mobileScaffold: PaymentPreviewMobileScreen(),
    );
  }
}
