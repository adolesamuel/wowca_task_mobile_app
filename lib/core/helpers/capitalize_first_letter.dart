abstract class CapitalizeFirstLetter {
  String toCapital(String sentence);
}

class CapitalizeFirstLetterImpl implements CapitalizeFirstLetter {
  @override
  String toCapital(String sentence) {
    try {
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
    } on FormatException {
      return 'Format not supported';
    }
  }
}
