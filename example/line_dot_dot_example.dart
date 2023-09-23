import 'package:line_dot_dot/line_dot_dot.dart';

void main() async {
  await CommandLineAnimation.lineDotDot(
    future: Future.delayed(Duration(seconds: 1)),
    prompt: 'Loading',
  );
  var exitCode = await CommandLineHelper.runProcess(
    'ls',
    ['-l'],
  );
  print('Process finished with exit code $exitCode');
}
