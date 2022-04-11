import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelAgent/agents_details.dart';
import 'package:rayan/model/modeApi/modelAgent/api_all_agents.dart';

Widget widgetgallaryagent(context, i) {
  return Container(
      // color: Colors.white,
      height: 123,
      width: MediaQuery.of(context).size.width,
      child: GetBuilder<homecontroller>(builder: (controller) {
        return (ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.saveImagesAgents.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Card(
                  child: Stack(children: [
                    Container(
                      width: 96,
                      height: 123,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'http://212.24.108.54/wsaAdmin/images/agent/${controller.saveImagesAgents[index]}',
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                      // decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //         image: NetworkImage(
                      //             "http://212.24.108.54/wsaAdmin/images/agent/${controller.saveImagesAgents[index]}"),
                      //         fit: BoxFit.cover)),
                    ),
                  ]),
                ),
              );
            }));
      }));
}
