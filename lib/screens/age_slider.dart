import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class AgeSlider extends StatefulWidget {
  const AgeSlider({super.key});

  @override
  State<AgeSlider> createState() => _AgeSliderState();
}

class _AgeSliderState extends State<AgeSlider> {
  double startValue = 18;
  double endValue = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Text("Age Range"),
              const Spacer(),
              Text("${startValue.toInt()} - ${endValue.toInt()}")
            ],
          ),
          Container(
              alignment: Alignment.centerLeft,
              child: FlutterSlider(
                values: const [18, 100],
                rangeSlider: true,
                max: 100,
                min: 18,
                step: const FlutterSliderStep(step: 1),
                jump: true,
                trackBar: FlutterSliderTrackBar(
                  inactiveTrackBarHeight: 2,
                  activeTrackBarHeight: 3,
                  activeTrackBar: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.green),
                ),

                disabled: false,
                handler: FlutterSliderHandler(
                  decoration: const BoxDecoration(),
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.green)),
                  ),
                ),
                rightHandler: FlutterSliderHandler(
                  decoration: const BoxDecoration(),
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.green)),
                  ),
                ),
                // disabled: false,
                tooltip: FlutterSliderTooltip(disabled: true),
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  if (handlerIndex == 0) {
                    startValue = lowerValue;
                  } else {
                    endValue = upperValue;
                  }
                  setState(() {});
                },
              )),
        ],
      )),
    );
  }
}
