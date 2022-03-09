import 'package:flutter/material.dart';
import 'package:my_first_app/app_button.dart';
import 'package:my_first_app/app_form_data.dart';

import 'app_dashboard.dart';
import 'textField.dart';

class AddNewJobScreen extends StatefulWidget {
  @override
  State<AddNewJobScreen> createState() => _AddNewJobScreenState();
}

class _AddNewJobScreenState extends State<AddNewJobScreen> {
  TextEditingController positionName = TextEditingController();
  TextEditingController positionDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: const Color(0xFF191720),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 49,
          left: 27,
          right: 27,
          bottom: 39
        ),
        child: ListView(
          children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               IconButton(
                 onPressed: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Dashboard()));
                 },
                 icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white,
                 size: 25),
               ),
               const SizedBox(width: 31),
               const Text("Add New Job",
                   style: TextStyle(
                       color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600, letterSpacing: -0.5,
                     fontFamily: 'Poppins'
                   )
               )
             ],
           ),
            const SizedBox(height: 11),

            // ------------   Position TextEdit Section   -------------  //

            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: const Color(0xFF1E1C24),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: const Color(0xFF5D5D67),
                      width: 1
                  )
              ),
              child: TextField(
                controller: positionName,
                style: const TextStyle(
                    fontSize: 15, color: Colors.white
                ),
                decoration: const InputDecoration(hintText: "Enter position name",
                    hintStyle: TextStyle(
                        color: Color(0xFF8F8F9E), fontSize: 15,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins'
                    ),
                    border: InputBorder.none

                ),
              ),
            ),
            const SizedBox(height: 5),

            // ------------   Requirement TextEdit Section   -------------  //

            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: const Color(0xFF1E1C24),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: const Color(0xFF5D5D67),
                      width: 1
                  )
              ),
              child: TextField(
                controller: positionDescription,
                maxLines: 11,
                style: const TextStyle(
                    fontSize: 15, color: Colors.white
                ),
                decoration: const InputDecoration(hintText: "Describe Requirements...",
                    hintStyle: TextStyle(
                        color: Color(0xFF8F8F9E), fontSize: 15.5,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins'
                    ),
                    border: InputBorder.none

                ),
              ),
            ),
            //Spacer(),
            const SizedBox(height: 180,),

            //  -----------  Submit Button  ------------  //

            GestureDetector(
              onTap: () {
                var data = JobPostData(positionName.text, positionDescription.text);
                Navigator.pop(context,data);
              },

              child: const AppButton(label: "Submit Job", toastMessage: "Job Submitted!",),


            )
          ],
        ),
      ),

    );
  }

  void getTextFromField(){
    print(positionName.text);
    print(positionDescription.text);
  }
}
