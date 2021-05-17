String toCapital({String sentence}) {
  List bingo = sentence.split(' ');
  List newList = [];
  String pamper = '';

  for (var item in bingo) {
    newList.add(item[0].toUpperCase() + item.substring(1));
  }

  for (var item in newList) {
    pamper = pamper + item + ' ';
  }
  return pamper;
}
