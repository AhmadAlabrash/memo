
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import 'receiving_method_mobile_screen.dart';
import 'receiving_method_tab_screen.dart';

class ReceivingMethodScreen extends StatelessWidget {
  const ReceivingMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      tabletScaffold: const ReceivingMethodTabScreen(
      
      ),
      mobileScaffold: ReceivingMethodMobileScreen(
    
      ),
    );
  }
}
