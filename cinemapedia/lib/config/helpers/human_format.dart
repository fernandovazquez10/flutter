import 'package:intl/intl.dart';

class HumanFormat {

  static String number( double number, [ int decimals = 0] ){
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: decimals,
      symbol: '',
    ).format(number);
    return formatterNumber;
  }

  static String spanishDate( String date ) {
    return date
    .split(' ')
    .map((String word){
      if (word != 'de'){
        return word.replaceFirst(word[0], word[0].toUpperCase());
      } else {
        return word;
      }
    })
    .join(' ');
  }

}