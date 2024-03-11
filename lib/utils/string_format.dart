class StringFormat {
  StringFormat._();
  static String roundToTwo(String input) {
    var out = "";
    var split = input.split('.');
    split[1] = split[1].substring(0, 2);
    out = split.join('.');
    return out;
  }
}
