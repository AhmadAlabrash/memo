import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import 'two_fa_mobile_screen.dart';
import 'two_fa_tab_screen.dart';

class TwoFaScreen extends StatelessWidget {
  const TwoFaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      tabletScaffold: TwoFaTabScreen(),
      mobileScaffold: TwoFaMobileScreen(),
    );
  }
}
