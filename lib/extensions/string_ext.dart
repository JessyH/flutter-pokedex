extension StringExt on String {
  int parseInt() => int.parse(this);

  String capitalize() => '${this[0].toUpperCase()}${this.substring(1)}';
}
