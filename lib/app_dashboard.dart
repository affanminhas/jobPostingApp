import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_addjob.dart';
import 'app_editjob.dart';
import 'app_form_data.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController searchController = TextEditingController();
  List<JobPostData> itemsOnSearch = [];
  List<JobPostData> items = [];
  String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: Container(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            backgroundColor: Color(0xFFE5E5E5),
            onPressed: () {
              Navigator.of(context)
                  .push<JobPostData>(
                      MaterialPageRoute(builder: (_) => AddNewJobScreen()))
                  .then((value) => setState(() {
                        if (value?.jobTitle != "" &&
                            value?.jobDescription != "") {
                          items.add(JobPostData(
                              value!.jobTitle, value.jobDescription));
                        }
                      }));
            },
            child: const Icon(
              Icons.add,
              size: 40,
              color: Color(0xFF191720),
            ),
          ),
        ),
        backgroundColor: Color(0xFF191720),
        body: Padding(
          padding: const EdgeInsets.only(
              top: 75,
              left: 27,
              //bottom: 59,
              right: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (_) => SignIn()));
                      },
                      icon: const Icon(Icons.arrow_back_ios_rounded,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
              const Text(
                "Affan Minhas",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 19),
              Container(
                padding: const EdgeInsets.only(
                  top: 7,
                  bottom: 8,
                  //left: 55
                ),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: const Color(0xFF1E1C24),
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: const Color(0xFF5D5D67), width: 1)),
                child: TextField(
                  onChanged: onSearch,
                  controller: searchController,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Color(0xFF5D5D67)),
                      hintText: "Search keywords",
                      hintStyle: TextStyle(
                        color: Color(0xFF8F8F9E),
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins',
                      ),
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                  child: items.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.only(top: 11, bottom: 17),
                          itemCount: updateAccordingToSearch(
                              items.length, itemsOnSearch.length),
                          itemBuilder: updateList,
                        )
                      : const Center(
                          child: Text(
                            "No job posted yet!",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF8F8F9E),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w300),
                          ),
                        ))
            ],
          ),
        ));
  }

  Widget updateList(BuildContext context, int index) => Padding(
        padding: const EdgeInsets.only(top: 11),
        child: Container(
          //padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: const Color(0xFF201E27),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 25),
            child: ListTile(
              title: Text(
                searchController.text.isNotEmpty
                    ? itemsOnSearch[index].jobTitle
                    : items[index].jobTitle,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                searchController.text.isNotEmpty
                    ? itemsOnSearch[index].jobDescription
                    : items[index].jobDescription,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8F8F9E),
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Poppins',
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      // setState(() {
                      //   items.removeAt(index);
                      // });
                      Navigator.of(context)
                          .push<JobPostData>(MaterialPageRoute(
                              builder: (_) => EditJobScreen(
                                    posname: items[index].jobTitle,
                                    requirement: items[index].jobDescription,
                                  )))
                          .then((value) => setState(() {
                                if (value?.jobTitle != "" &&
                                    value?.jobDescription != "") {
                                  items[index].jobTitle = value!.jobTitle;
                                  items[index].jobDescription =
                                      value.jobDescription;
                                }
                              }));
                    },
                    icon: const Icon(Icons.edit, color: Colors.white, size: 23),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                    icon: new Image.asset("images/delete_icon.png"),
                    //icon: const Icon(Icons.delete_outlined, color: Colors.red,size: 25),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  void onSearch(String search) {
    setState(() {
      itemsOnSearch = items
          .where((element) =>
              element.jobTitle.toLowerCase().contains(search) ||
              element.jobDescription.toLowerCase().contains(search))
          .toList();
    });
  }

  updateAccordingToSearch(int item, int searchItem) {
    var value;
    if (searchController.text.isNotEmpty) {
      value = searchItem;
    } else {
      value = item;
    }
    return value;
  }
}
