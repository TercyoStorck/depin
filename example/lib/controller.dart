class View1Controller {
  final String text;
  final String text2;
  final int i;
  final double d;

  View1Controller(
    this.text,
    this.text2, {
    required this.i,
    String? s,
    required this.d,
  });
}

class View2Controller {
  //final String text;
  final int i;
  final double d;
  final String? s;

  View2Controller(/* this.text,  */ {
    required this.i,
    this.s,
    required this.d,
  });
}
