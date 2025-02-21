import 'export.dart';
class LabTestReportPage extends StatelessWidget {

  const LabTestReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<DoctorController>(context);
    DiagonasticData? _labTestInfo = _controller.diagonasticData; // get diagnostic data like constructor
    return Scaffold(
      body: Center(
        child: Image.network(_labTestInfo!.reportImageUrl,fit: BoxFit.contain,),
      ),
    );
  }
}
