

import 'package:e_comm/utils/app-constant.dart';
import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  // we take parameter one widget not use again and again
  final String headingTitle;
  final String headingSubTitle;
  final VoidCallback onTap;
  final String buttonText;
   const HeadingWidget({
     super.key,
     required this.headingTitle,
     required this.headingSubTitle,
     required this.onTap,
     required this.buttonText,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: Padding(
        padding:EdgeInsets.all(8.0),
        child: Row(
          // leaving equal spaces between each child.
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(headingTitle,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900,
                ),
                ),
                Text(headingSubTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: AppConstant.appMainColor,
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                      color: AppConstant.appMainColor,
                    ),
                  ),
                ),
              
              ),
            )
          ],
        ),
      ),
    );
  }
}
