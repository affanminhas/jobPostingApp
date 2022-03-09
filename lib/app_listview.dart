import 'package:flutter/material.dart';

import 'app_editjob.dart';

class AppListView extends StatelessWidget {
  final String jobTitle;
  final String jobLocation;
  const AppListView({required this.jobTitle, required this.jobLocation});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF201E27),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 25
        ),
        child: ListTile(
          title: Text(
              jobTitle,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: Colors.white,

            ),
          ),
          subtitle: Text(
            jobLocation,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF8F8F9E),
              fontWeight: FontWeight.normal,
              fontFamily: 'Poppins',
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: (){
                  // Navigator.of(context).push(MaterialPageRoute(builder: (_)=> EditJobScreen()));
                },
                icon: const Icon(Icons.edit, color: Colors.white,size: 25),
              ),
              IconButton(
                onPressed: (){},
                icon: new Image.asset("images/delete_icon.png"),
                //icon: const Icon(Icons.delete_outlined, color: Colors.red,size: 25),
              )
            ],
          ),
        ),
      ),

    );
  }
}
