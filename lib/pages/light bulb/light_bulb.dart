import 'dart:ffi';

import 'package:flutter/material.dart';

class LightBulb extends StatefulWidget {
  const LightBulb({Key? key}) : super(key: key);

  @override
  _LightBulbState createState() => _LightBulbState();
}

class _LightBulbState extends State<LightBulb>
    with SingleTickerProviderStateMixin {
  bool isOn = false;

  late double scale;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              color: isOn ? Colors.yellow : Colors.grey.shade700,
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 4,
            right: MediaQuery.of(context).size.width / 2 - 4,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          isOn
              ? Positioned(
                  left: MediaQuery.of(context).size.width / 2 - 75,
                  right: MediaQuery.of(context).size.width / 2 - 75,
                  top: 202,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                        angle: 3.15,
                        child: GestureDetector(
                            onTapDown: tapDown,
                            onTapUp: tapUp,
                            onTap: () {
                              setState(() {
                                isOn = false;
                              });
                            },
                            child: Image.network(
                              'https://ouch-cdn2.icons8.com/X5fB-F4h5Z-W9fimJnFUJ_So5Z2Kh6ULPuw-I6jK790/rs:fit:784:1134/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNzQ3/LzU1YzYyNmUxLTI5/ZTctNDFmNS04M2Rk/LTZmOTFiMzkwMTQ4/MS5zdmc.png',
                              width: 150,
                            ))),
                  ),
                )
              : Positioned(
                  left: MediaQuery.of(context).size.width / 2 - 75,
                  right: MediaQuery.of(context).size.width / 2 - 75,
                  top: 202,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                        angle: 3.15,
                        child: GestureDetector(
                            onTapDown: tapDown,
                            onTapUp: tapUp,
                            onTap: () {
                              setState(() {
                                isOn = true;
                              });
                            },
                            child: Image.network(
                              'https://ouch-cdn2.icons8.com/GCKndOXpaXkSHmDQvtUOP2yMUrV9LSpXXJRneOqvM2o/rs:fit:784:1134/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMTY1/L2Q2ZDBkNTkwLTBl/ZDAtNDA5MC05ZjUw/LTIzNGJjZjRmZDdm/Yy5zdmc.png',
                              color: Colors.grey.shade800,
                              width: 150,
                            ))),
                  ),
                )
        ],
      ),
    );
  }

  void tapDown(TapDownDetails details) {
    controller.forward();
  }

  void tapUp(TapUpDetails details) {
    controller.reverse();
  }
}
