import 'package:line_dot_dot/line_dot_dot.dart';

void main() async {
  await CommandLineAnimation.lineDotDot(
    future: Future.delayed(Duration(seconds: 3)),
    prompt: 'Loading',
  );
}
