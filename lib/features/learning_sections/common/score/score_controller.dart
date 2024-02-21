

class ScoreController {

  static int processOverallScore(double pronScore, double fluencyScore, double accuracyScore){
    double score = ((pronScore + fluencyScore)/200)*100;

    double accuracy = 100-accuracyScore;

    double result = score - accuracy;

    if(result > 0){
      return result.ceil();

    } else {
      return 0;
    }
  }


  static int processFluencyScore(double pronScore, double fluencyScore){
    double score = ((pronScore + fluencyScore)/200)*100;

    return score.ceil();
  }

}



///Documentation:

/*

//This is so harsh on the user
int score = processScore(pronScore, fluencyScore, accurateScore);  //Chosen <--

//This gives high score
int score2 = (((pronScore + fluencyScore + accurateScore)/300)*100).ceil();

//This is a little kinder
int score3 = lowestOfThree(pronScore, fluencyScore, accurateScore);

*/


/*
int lowestOfThree(double a, double b, double c) {
  return min(min(a, b), c).ceil();
}
*/