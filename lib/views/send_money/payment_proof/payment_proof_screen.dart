import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import 'payment_proof_mobile_screen.dart';
import 'payment_proof_tab_screen.dart';


class PaymentProofScreen extends StatelessWidget {
  const PaymentProofScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      tabletScaffold:   PaymentProofTabScreen(
      ),
      mobileScaffold: PaymentProofMobileScreen(
      ),
    );
  }
}
