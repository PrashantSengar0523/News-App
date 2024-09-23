import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/responsive.dart';

class CustomDialogBox extends StatelessWidget {
  final String text;
  final VoidCallback onCancelPressed;
  final VoidCallback onConfirmPressed;

  const CustomDialogBox({
    super.key,
    required this.text,
    required this.onCancelPressed,
    required this.onConfirmPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 12,right: 12,left: 12),
        height:175,
        width: Responsive.getWidth(context)/1.5,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children:[
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Semibold',
                  fontSize: Responsive.getWidth(context)*0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30,),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 90,
                        decoration: BoxDecoration(
                          border: Border.all(color: TColors.darkGrey),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: Center(child: Text("Cancel",style: TextStyle(fontFamily: 'Regular',fontSize: Responsive.getWidth(context)*0.03,),)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container( 
                        padding: const EdgeInsets.all(8),
                        width: 90,
                        decoration: BoxDecoration(
                        color: TColors.primary,
                          border: Border.all(color: TColors.darkGrey),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: Center(child: Text("Delete",style: TextStyle(fontFamily: 'Medium',fontSize: Responsive.getWidth(context)*0.03,color: TColors.white),)),
                      ),
                    )
                  ],
                ),
              )
             
              
            ],
          ),
        ),
      ),
    );
  }
}