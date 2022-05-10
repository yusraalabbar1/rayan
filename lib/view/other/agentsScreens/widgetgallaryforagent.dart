import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayan/control/homecontroller.dart';
import 'package:rayan/model/modeApi/modelAgent/agents_details.dart';
import 'package:rayan/model/modeApi/modelAgent/api_all_agents.dart';
import 'package:rayan/utils/constant/url.dart';

Widget widgetgallaryagent(context, i) {
  homecontroller controller = Get.put(homecontroller());
  return controller.saveImagesAgents.length > 0
      ? Container(
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1),
                            child: allAgent[controller.indexAgent]
                                        ['imageUrl'] !=
                                    null
                                ? Image(
                                    image: CachedNetworkImageProvider(
                                      baseUrlAdmin +
                                          '/images/agent/${controller.saveImagesAgents[index]}',
                                    ),
                                    fit: BoxFit.fill,
                                  )
                                : Image(
                                    image: CachedNetworkImageProvider(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKHGD0_INEcX-OvEp38MI15RuKfYrQElYegQ&usqp=CAU',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ]),
                    ),
                  );
                }));
          }))
      : Container();
}
