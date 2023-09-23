import 'dart:async';
import 'dart:io';

class CommandLineHelper {
  static Future<int> runProcess(
    String executable,
    List<String> arguments,
  ) async {
    final process = await Process.start(executable, arguments);
    await process.stdout.listen((event) => stdout.add(event)).asFuture();
    return process.exitCode;
  }
}
