import 'package:flutter/material.dart';

class DashBoardDoctor extends StatelessWidget {
  const DashBoardDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.4),

      child: Stack(

        children: [
          Opacity(
            opacity: 0.3,
            child: Image.asset('images/doctor searching.jpg',fit: BoxFit.cover,width:MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.height),
          ),
          Positioned(
            top: 0,right: 0,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20,top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.3)
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width/4,
                    child: TextField(

                      decoration: InputDecoration(
                          hintText: 'Search for a patient by ID',
                          hintStyle: TextStyle(fontWeight: FontWeight.w300,
                              color: Colors.white),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                Positioned(top: 0,right: 0,bottom: 0,child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.primary
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ))
              ],
            ),
          ),

        ],
      ),
    );
  }
}