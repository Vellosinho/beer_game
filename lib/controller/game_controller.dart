import 'package:drinking_game/model/player_class.dart';
import 'package:flutter/material.dart';

class GameController extends ChangeNotifier{
  // Respostas:
  int currentRound = 0;
  int currentPlayerIndex = 0;
  int currentCorrectAnswer = 0;

  int highestScore = 0;

  List<Player> playerList = [];
  int selectedAnswer = 0;
  String selectedAnswerName = '';

  void confirmCorrectAnswer() {
    currentCorrectAnswer = selectedAnswer;
    selectedAnswer = 0;
    selectedAnswerName = '';;
    notifyListeners();
  }

  void updateCurrentPlayer() {
    if(currentPlayerIndex < playerList.length) {
      currentPlayerIndex++;
    } else {
      currentPlayerIndex = 0;
    }
    notifyListeners();
  }

  void updateCurrentGame() {
    currentRound++;
  }

  void chooseAnswer(int answer, String name) {
    if (answer == selectedAnswer) {
      selectedAnswer = 0;
    } else {
      selectedAnswer = answer;
    }
    selectedAnswerName = name;
    notifyListeners();
  }

  void confirmSelection() {
    if(selectedAnswer == currentCorrectAnswer) {
      playerList[currentPlayerIndex - 1].points++;
    }
    selectedAnswer = 0;
  }

  void addPlayer(String name) {
    Player newPlayer = Player(
      name: name,
      points: 0,
    );
    playerList.add(newPlayer);
    notifyListeners();
  }

  void finishGame() {
    playerList.sort((a, b) => b.points.compareTo(a.points));
    highestScore = playerList[0].points;
  }
}