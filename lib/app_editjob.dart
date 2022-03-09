import 'package:flutter/material.dart';
import 'package:my_first_app/app_form_data.dart';

import 'app_button.dart';
import 'app_dashboard.dart';
import 'textField.dart';

class EditJobScreen extends StatefulWidget {

  String posname = "";
  String requirement = "";
  EditJobScreen({required this.posname, required this.requirement});

  @override
  State<EditJobScreen> createState() => _EditJobScreenState(posname, requirement);
}
class _EditJobScreenState extends State<EditJobScreen> {
  String posname;
  String requirement;

  _EditJobScreenState(this.posname, this.requirement);

  @override
  Widget build(BuildContext context) {
    TextEditingController position = TextEditingController()..text = posname;
    TextEditingController description = TextEditingController()..text = requirement;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF191720),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 49, left: 27, right: 27, bottom: 39),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (_) => Dashboard()));
                  },
                  icon: const Icon(Icons.arrow_back_ios_rounded,
                      color: Colors.white, size: 25),
                ),
                const SizedBox(width: 31),
                const Text("Edit Job",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.5,
                        fontFamily: 'Poppins'))
              ],
            ),
            const SizedBox(height: 11),
            // const AppTextField(
            //   placeholder: "Enter position name",
            // ),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: const Color(0xFF1E1C24),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF5D5D67), width: 1)),
              child: TextField(
                controller: position,
                style: const TextStyle(fontSize: 15, color: Colors.white),
                decoration: const InputDecoration(
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: const Color(0xFF1E1C24),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF5D5D67), width: 1)),
              child: TextField(
                controller: description,
                maxLines: 11,
                style: const TextStyle(fontSize: 15, color: Colors.white),
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
            //const Spacer(),
            SizedBox(height: 180,),
            GestureDetector(
              onTap: () {
                var data = JobPostData(position.text, description.text);
                Navigator.pop(context,data);
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (_) => Dashboard()));
              },
              child: const AppButton(label: "Update Job", toastMessage: "Job Modified!",),
            )
          ],
        ),
      ),
    );
  }

  void UpdateJob() {}
}

class EditData{
  final positionTitle;
  final positionDescr;

  EditData(this.positionTitle, this.positionDescr);
}

