import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:toast/toast.dart';

class AppButton extends StatelessWidget {

  final String label;
  final String toastMessage ;

  const AppButton({required this.label, required this.toastMessage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: const Color(0xFF5D5D67),
                    width: 1
                )
            ),
            child: GestureDetector(
              onTap: (){
                //Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
              },
              child: Container(
                child: Text(label, style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF191720),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins'
                ),)
              ),
            ),
          ),
        ),
      ],
    );
  }
  showToastMessage(String message){
    // Fluttertoast.showToast(
    //     msg: message,
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );
  }
}
