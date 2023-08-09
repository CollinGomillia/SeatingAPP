import 'package:flutter/material.dart';
import 'package:seatingapp/colorschemes/colorschemes.dart';
import 'package:seatingapp/pages/widget/build_chairs.dart';

class SeatSelector extends StatefulWidget {
  @override
  _SeatSelectorState createState() => _SeatSelectorState();
}

class _SeatSelectorState extends State<SeatSelector> {
  // _chairStatus represents the status of each chair in the layout
  List<List<int>> _chairStatus = [
    // 1: Available, 2: Selected, 3: Reserved, 0: Empty space (not shown in the layout)
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 3, 1, 1],
    [1, 1, 1, 1, 1, 3, 3],
    [2, 2, 2, 1, 3, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
  ];

  // Function to handle seat selection or deselection
  void _onSeatTap(int row, int col) {
    setState(() {
      if (_chairStatus[row][col] == 1) {
        _chairStatus[row][col] = 2; // Select the seat if it's available
      } else if (_chairStatus[row][col] == 2) {
        _chairStatus[row][col] = 1; // Deselect the seat if it's selected
      }
    });
  }

  // Function to build the list of chairs based on _chairStatus
  Widget _chairList() {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: <Widget>[
          for (int i = 0; i < _chairStatus.length; i++)
            Container(
              margin: EdgeInsets.only(top: i == 3 ? size.height * .02 : 0),
              child: Row(
                children: <Widget>[
                  for (int x = 0; x < _chairStatus[i].length; x++)
                    if (_chairStatus[i][x] != 0)
                      Expanded(
                        flex: x == 0 || x == _chairStatus[i].length - 1 ? 2 : 1,
                        child: x == 0 ||
                            x == _chairStatus[i].length - 1 ||
                            (i == 0 && x == 1) ||
                            (i == 0 && x == _chairStatus[i].length - 2) ||
                            (x == (_chairStatus[i].length - 1) ~/ 2)
                            ? Container() // Empty container for spacing and layout
                            : GestureDetector(
                          onTap: () => _onSeatTap(i, x),
                          child: Container(
                            height: size.width / (_chairStatus[i].length * 1.5),
                            margin: EdgeInsets.all(5),
                            child: _chairStatus[i][x] == 1
                                ? BuildChairs.availableChair()
                                : _chairStatus[i][x] == 2
                                ? BuildChairs.selectedChair()
                                : BuildChairs.reservedChair(),
                          ),
                        ),
                      ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: 47,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: size.height * .02,
            child: Container(width: size.width, child: _chairList()),
          ),
        ],
      ),
    );
  }
}

class SeatLayoutWithNumbering extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row for displaying seat numbers on top
        Row(
          children: [
            // Empty container to align the numbering with the seats
            Container(
              width: 16,
            ),
            for (int i = 0; i < 7; i++)
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    (i + 1).toString(), // Display seat numbers from 1 to 7
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        Row(
          children: [
            // Seat Numbering (to the side)
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  // Display alphabetical seat numbering from A to F (i.e., 6 rows)
                  for (int i = 0; i < 6; i++)
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          String.fromCharCode(i + 65), // A, B, C, ...
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            // Seat Selector
            SeatSelector(), // Include the seat selector widget
          ],
        ),
      ],
    );
  }
}
