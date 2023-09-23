import 'dart:io';

class CommandLineHelper {
  static Future<int> runProcess(
    String executable,
    List<String> arguments,
  ) async {
    var process = await Process.start(executable, arguments);
    process.stdout.pipe(stdout);
    return process.exitCode;
  }
}
