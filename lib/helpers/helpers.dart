import 'dart:developer' as dev show log;
class Helpers {
  listToString(List list) {
    var string = '';
    dev.log('list to string ${list.toString()}');
    for (int i = 0; i < list.length; i++) {
      if (i > 0) {
        string += ', ';
      }
      var element = list[i];
      string += element.toString();
    }
    return string;
  }
}
