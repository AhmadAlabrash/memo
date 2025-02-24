import '../../controller/navigation/transaction_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/transaction/transaction_screen_widget.dart';

class TransactionMobileScreen extends StatelessWidget {
  const TransactionMobileScreen({
    super.key,
    required this.controller,
  });
  final TransactionController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.whiteColor,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return  TransactionScreenWidget();
  }
}
