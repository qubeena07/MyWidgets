import 'package:flutter/material.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';

import '../widgets/grid_item.dart';

class DraggableScreen extends StatefulWidget {
  const DraggableScreen({super.key});

  @override
  State<DraggableScreen> createState() => _DraggableScreenState();
}

class _DraggableScreenState extends State<DraggableScreen> {
  List<int> numbersList = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  List<int> shuffleBoard() {
    // Add the following code to the function
    numbersList.shuffle();
    return numbersList;
  }

  late List<DraggableGridItem> listOfDraggableGridItem;

  @override
  void initState() {
    super.initState();
    shuffleBoard();
    listOfDraggableGridItem = [
      DraggableGridItem(
          child: GridItem(
            value: numbersList[0],
          ),
          isDraggable: true),
      DraggableGridItem(
          child: GridItem(
            value: numbersList[1],
          ),
          isDraggable: true),
      DraggableGridItem(
          child: GridItem(
            value: numbersList[2],
          ),
          isDraggable: true),
      DraggableGridItem(
          child: GridItem(
            value: numbersList[3],
          ),
          isDraggable: true),
      DraggableGridItem(
          child: GridItem(
            value: numbersList[4],
          ),
          isDraggable: true),
      DraggableGridItem(
          child: GridItem(
            value: numbersList[5],
          ),
          isDraggable: true),
      DraggableGridItem(
          child: GridItem(
            value: numbersList[6],
          ),
          isDraggable: true),
      DraggableGridItem(
          child: GridItem(
            value: numbersList[7],
          ),
          isDraggable: true),
      DraggableGridItem(
          child: GridItem(
            value: numbersList[8],
          ),
          isDraggable: true),
    ];
  }

  Color value = Colors.blueAccent;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: DraggableGridViewBuilder(
            padding: const EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 2.5),
            ),
            children: listOfDraggableGridItem,
            isOnlyLongPress: false,
            dragCompletion: (List<DraggableGridItem> list, int beforeIndex,
                int afterIndex) {},
            dragFeedback: (List<DraggableGridItem> list, int index) {
              return SizedBox(
                width: 200,
                height: 150,
                child: list[index].child,
              );
            },
            dragPlaceHolder: (List<DraggableGridItem> list, int index) {
              return PlaceHolderWidget(
                child: Container(
                  color: const Color.fromARGB(255, 209, 209, 209),
                ),
              );
            },
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Draggable(
          //       // data: Colors.black,/
          //       feedback: Container(
          //         height: 200,
          //         width: 200,
          //         color: Colors.yellow,
          //       ),
          //       childWhenDragging: Container(
          //         height: 200,
          //         width: 200,
          //         color: Colors.red,
          //       ),
          //       child: Container(
          //         height: 200,
          //         width: 200,
          //         color: Colors.pink,
          //       ),
          //     ),
          //     DragTarget(
          //       builder: (BuildContext comtext, List<dynamic> accepted,
          //           List<dynamic> rejected) {
          //         return Container(
          //           height: 200,
          //           width: 200,
          //           color: value,
          //         );
          //       },
          //       onAccept: (Color color) {
          //         setState(() {
          //           value = color;
          //         });
          //       },
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }
}
