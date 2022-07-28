class StringProcess {
  static String stringProcess(String? id) {
    String? string = id.toString();
    string = string.toLowerCase();
    string = string.substring(0, string.length - 20);
    string = string.replaceAll(RegExp('[^a-z0-9]'), '');
    string = string.replaceAll('a', '1');
    string = string.replaceAll('b', '2');
    string = string.replaceAll('c', '3');
    string = string.replaceAll('d', '4');
    string = string.replaceAll('e', '5');
    string = string.replaceAll('f', '6');
    string = string.replaceAll('g', '7');
    string = string.replaceAll('h', '8');
    string = string.replaceAll('i', '9');
    string = string.replaceAll('j', '0');
    string = string.replaceAll('k', '1');
    string = string.replaceAll('l', '2');
    string = string.replaceAll('m', '3');
    string = string.replaceAll('n', '4');
    string = string.replaceAll('o', '5');
    string = string.replaceAll('p', '6');
    string = string.replaceAll('q', '7');
    string = string.replaceAll('r', '8');
    string = string.replaceAll('s', '9');
    string = string.replaceAll('t', '0');
    string = string.replaceAll('u', '1');
    string = string.replaceAll('v', '2');
    string = string.replaceAll('w', '3');
    string = string.replaceAll('x', '4');
    string = string.replaceAll('y', '5');
    string = string.replaceAll('z', '6');
    return string;
  }
}
