import 'package:flutter/material.dart';

class TicTacToeScreen extends StatefulWidget {
  const TicTacToeScreen({super.key});

  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  late List<List<String>> board;
  late String currentPlayer;
  late bool gameOver;

  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  void startNewGame() {
    setState(() {
      board = List<List<String>>.generate(3, (_) => List<String>.filled(3, ''));
      currentPlayer = 'X';
      gameOver = false;
    });
  }

  void makeMove(int row, int col) {
    if (board[row][col] == '' && !gameOver) {
      setState(() {
        board[row][col] = currentPlayer;
        checkWinner(row, col);
        currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
      });
    }
  }

  void checkWinner(int row, int col) {
    // Check row
    if (board[row][0] == board[row][1] &&
        board[row][1] == board[row][2] &&
        board[row][0] != '') {
      setState(() {
        gameOver = true;
      });
    }

    // Check column
    if (board[0][col] == board[1][col] &&
        board[1][col] == board[2][col] &&
        board[0][col] != '') {
      setState(() {
        gameOver = true;
      });
    }

    // Check diagonal
    if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[0][0] != '') {
      setState(() {
        gameOver = true;
      });
    }
    if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[0][2] != '') {
      setState(() {
        gameOver = true;
      });
    }

    // Check for a tie
    if (!board.any((row) => row.any((cell) => cell == '')) && !gameOver) {
      setState(() {
        gameOver = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Player: $currentPlayer',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                final row = index ~/ 3;
                final col = index % 3;
                return GestureDetector(
                  onTap: () => makeMove(row, col),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 183, 233, 185),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Container(
                      color: board[row][col] == 'X'
                          ? Colors.amberAccent
                          : (board[row][col] == "O")
                              ? Colors.redAccent
                              : const Color.fromARGB(255, 183, 233, 185),
                      child: Center(
                        child: Text(
                          board[row][col],
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            if (gameOver) const Text("Start a new game!!"),
            if (gameOver)
              ElevatedButton(
                onPressed: startNewGame,
                child: const Text('New Game'),
              ),
          ],
        ),
      ),
    );
  }
}
