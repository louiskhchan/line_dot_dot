import 'dart:io';

extension ProcessExtension on Process {
  static Future<int> runAndStream(
    String executable,
    List<String> arguments,
  ) async {
    var process = await Process.start(executable, arguments);
    process.stdout.pipe(stdout);
    return process.exitCode;
  }
}
