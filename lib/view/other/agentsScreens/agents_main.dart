import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelAgent/agent_info.dart';
import 'package:rayan/model/modeApi/modelAgent/agents_details.dart';
import 'package:rayan/model/modeApi/modelAgent/api_all_agents.dart';
import 'package:rayan/utils/constant/color.dart';
import 'package:rayan/view/auth/widget/themeWst.dart';
import 'package:rayan/view/other/agentsScreens/part2agent.dart';
import 'package:rayan/view/other/agentsScreens/widgetTowButtonagent.dart';
import 'package:rayan/view/other/agentsScreens/widgetgallaryforagent.dart';
import 'package:rayan/view/other/widget/design_appbar.dart';

class agentsMain extends StatefulWidget {
  agentsMain({Key? key}) : super(key: key);

  @override
  State<agentsMain> createState() => _agentsMainState();
}

class _agentsMainState extends State<agentsMain> {
  _onSearchFieldChanged(String value) async {
    // to fill out next!
    var results;
    if (value.isEmpty) {
      print("empty");
      print(allAgent);
      results = allAgent;
    } else {
      results = allAgent
          .where((user) =>
              user["name"].toLowerCase().contains(value.toLowerCase()))
          .toList();
    }

    setState(() {
      foundAll = results;
    });
  }

  homecontroller controller = Get.put(homecontroller());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        containerMaine(),
        Container(
          decoration: boxDecorationMain(),
        ),
        GetBuilder<homecontroller>(builder: (controller) {
          return (controller.i_agent == 0
              ? ListView(
                  //part one
                  shrinkWrap: true,
                  children: [
                    rowAppbar(context),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15.0),
                              prefixIcon: Icon(
                                Icons.search,
                                color: MyColors.color1,
                              ),
                              hintText:
                                  "search for your favorite agent in your city"
                                      .tr),
                          onChanged: (string) {
                            _onSearchFieldChanged(string);
                          },
                        ),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: foundAll.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GetBuilder<homecontroller>(
                            builder: (controller) {
                          return (InkWell(
                              onTap: () {
                                controller.IndexAgent(index);
                                controller.i_agent = 1;
                                imagesAgents = [];
                                agentDetails(foundAll[index]['id']);
                                //Navigator.of(context).pushNamed("infoAgent");
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 128,
                                    width: 147,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "http://212.24.108.54/wsaAdmin/images/${foundAll[index]['imageUrl']}"),
                                            fit: BoxFit.cover)),
                                  ),
                                  Text("${foundAll[index]['name']}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Almarai')),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  // Text("${foundAll[index]['description']}",
                                  //     style: TextStyle(
                                  //         color: Colors.white,
                                  //         fontSize: 9,
                                  //         fontFamily: 'Almarai'))
                                ],
                              )));
                        });
                      },
                    )
                  ],
                )
              : part2Agent(context));
        })
      ],
    ));
  }
}
