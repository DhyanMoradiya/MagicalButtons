import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  Home({super.key});

  State<Home> createState() => _homeState();
}

squreIcon(){
  return Icon(
    Icons.square,
    color: Colors.green,
    size: 30,
  );
}

circuleIcon(){
  return Icon(
    Icons.circle,
    color: Colors.yellow,
    size: 30,
  );
}

triangleIcon(){
  return Icon(
    Icons.warning,
    color: Colors.red,
    size: 30,
  );
}

class _homeState extends State<Home> {
  var random = Random();
  int? index;
  List<Map<String , dynamic>>? iconsList;
  List<List>? ignorePosition; //0 : top, 1 : left

  @override
  void initState() {
    index = 0;
    iconsList = [];
    ignorePosition = [[0],[0]];
    super.initState();
  }

  positionedIcon(Map iconMap, int index){
    return Positioned(
        top: iconMap['top'],
        left: iconMap['left'],
        child: IconButton(
          onPressed: (){
            if(iconMap['icon'].color == Colors.red){
              setState(() {
                iconsList![index]['icon'] = circuleIcon();
              });
              }else if(iconMap['icon'].color == Colors.yellow){
              setState(() {
                iconsList![index]['icon'] = squreIcon();
              });
            }else{
              Timer(Duration(milliseconds: 200), () {
                setState(() {
                  iconsList!.removeAt(index);
                });
              });
            }
          },
            icon: iconMap['icon']
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: iconsList!.length > 0 ?
                Stack(
                   children: [
                     for(int i = 0; i < iconsList!.length; i++) positionedIcon(iconsList![i], i)
                  ],
                )
                    : Center(
                  child: Text("Tap on bellow buttons"),
                )
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: (){
                          double top = 0;
                          double left = 0;
                          while(true) {
                            bool isOverLaping = false;
                            top = random.nextInt(((MediaQuery
                                .of(context)
                                .size
                                .height
                                .toInt() - 100) - 0)).toDouble();
                            left = random.nextInt(((MediaQuery
                                .of(context)
                                .size
                                .width
                                .toInt() - 50) - 0)).toDouble();
                            for(int i = 0; i < ignorePosition![0].length; i++){
                              if((top - ignorePosition![0][i]).abs() < 25 && (left - ignorePosition![1][i]).abs() < 25){
                                isOverLaping = true;
                                break;
                              }
                            }
                            if(isOverLaping==false){
                              break;
                            }
                          }
                          setState(() {
                            ignorePosition![0].add(top);
                            ignorePosition![1].add(left);
                            iconsList!.add({
                              'icon' : squreIcon(),
                              'top' : top,
                              'left' : left
                            });
                          });
                        },
                        icon: squreIcon()
                    ),
                    IconButton(
                        onPressed: (){
                          double top = 0;
                          double left = 0;
                          while(true) {
                            bool isOverLaping = false;
                            top = random.nextInt(((MediaQuery
                                .of(context)
                                .size
                                .height
                                .toInt() - 100) - 0)).toDouble();
                            left = random.nextInt(((MediaQuery
                                .of(context)
                                .size
                                .width
                                .toInt() - 50) - 0)).toDouble();
                            for(int i = 0; i < ignorePosition![0].length; i++){
                              if((top - ignorePosition![0][i]).abs() < 25 && (left - ignorePosition![1][i]).abs() < 25){
                                isOverLaping = true;
                                break;
                              }
                            }
                            if(isOverLaping==false){
                              break;
                            }
                          }
                          setState(() {
                            ignorePosition![0].add(top);
                            ignorePosition![1].add(left);
                            iconsList!.add({
                              'icon' : circuleIcon(),
                              'top' : top,
                              'left' : left
                            });
                          });
                        },
                        icon: circuleIcon()
                    ),
                    IconButton(
                        onPressed: (){
                          double top = 0;
                          double left = 0;
                          while(true) {
                            bool isOverLaping = false;
                            top = random.nextInt(((MediaQuery
                                .of(context)
                                .size
                                .height
                                .toInt() - 100) - 0)).toDouble();
                            left = random.nextInt(((MediaQuery
                                .of(context)
                                .size
                                .width
                                .toInt() - 50) - 0)).toDouble();
                            for(int i = 0; i < ignorePosition![0].length; i++){
                              if((top - ignorePosition![0][i]).abs() < 25 && (left - ignorePosition![1][i]).abs() < 25){
                                isOverLaping = true;
                                break;
                              }
                            }
                            if(isOverLaping==false){
                              break;
                            }
                          }
                          setState(() {
                            ignorePosition![0].add(top);
                            ignorePosition![1].add(left);
                            iconsList!.add({
                              'icon' : triangleIcon(),
                              'top' : top,
                              'left' : left
                            });
                          });
                        },
                        icon: triangleIcon()
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}