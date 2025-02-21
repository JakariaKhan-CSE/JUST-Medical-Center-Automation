import 'package:flutter/material.dart';

import '../../../../../data/doctorData.dart';

class availabledoctorlist extends StatelessWidget {
  const availabledoctorlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: DoctorData.data.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> singleData = DoctorData.data[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 5,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            singleData['img'],
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                          ),
                        ),
                        Positioned(
                            bottom: -5,
                            left: 35,
                            child: Container(
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.green),
                              child: const Center(
                                  child: Text(
                                'online',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )),
                            ))
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          singleData['name'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        // SizedBox(height: 5,),
                        Text(
                          singleData['department'],
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
