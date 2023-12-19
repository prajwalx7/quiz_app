class QuizQuestion {
  QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

    //new list is getting copied and shuffled
  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);// create e copy store it in var
    shuffledList.shuffle();// the shuffle it
    return shuffledList;// return updated shuffled list
  }
}
