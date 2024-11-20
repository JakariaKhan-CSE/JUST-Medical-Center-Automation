import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/controller/doctorProvider.dart';
import 'package:provider/provider.dart';


class doctorListbuilder extends StatelessWidget {
  const doctorListbuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Fetch prescriptions on first build
    final doctorNotifier = Provider.of<DoctorNotifier>(context, listen: false);
    doctorNotifier.getAllDoctorList();

    return Consumer<DoctorNotifier>(
      builder: (context, doctorNotifier, child) {
        // access list
        final doctors = doctorNotifier.doctorList;
        if (doctors.isEmpty) {
          return Center(
            child: Text(
              'No Doctors Found',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          );
        }

        return Expanded(
            // if nested class avoid this model. remove useless attribute and make single model. So that easily access each attribute
            child: GridView.builder(
          shrinkWrap: true,
          itemCount: doctors.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 1),
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 6,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          doctor.profile ?? '',
                          fit: BoxFit.contain,
                          width: 150,
                          height: 150,
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            doctor.name!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            doctor.specialist ?? 'MBBS Doctor',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      )),
                ],
              ),
            );
          },
        ));
      },
    );
  }
}
