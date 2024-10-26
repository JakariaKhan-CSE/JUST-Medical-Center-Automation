import 'package:flutter/material.dart';

import '../../../responsive.dart';

class searchBar extends StatelessWidget {
  const searchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20,top: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black.withOpacity(0.8)
            ),
            child: SizedBox(
              width: Responsive.isDesktop(context) ? MediaQuery.of(context).size.width/4 :
              MediaQuery.of(context).size.width/1.7,
              child: TextField(
                // add controller here
                style: TextStyle(
                    color: Colors.white  // when pharmacist type any medicine name color is white
                ),
                decoration: InputDecoration(

                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: 'Search for a medicine',
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
    );
  }
}