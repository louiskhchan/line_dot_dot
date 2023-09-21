import 'dart:async';
import 'dart:io';

class CommandLineAnimation {
  static Future<T> lineDotDot<T>({
    required Future<T> future,
    String prompt = '',
    String donePromptSuffix = 'done.',
    String Function(T futureResult)? promptSuffixOnFutureResult,
  }) async {
    final completer = Completer();
    future.then(
      completer.complete,
    );

    for (int i = 0; !completer.isCompleted; i++) {
      stdout.write('$prompt${[
        for (int j = 0; j < 3; j++) j == 2 - (i % 4 - 2).abs() ? '.' : ' '
      ].join()}\r');
      await Future.any([
        completer.future,
        Future.delayed(Duration(milliseconds: 250)),
      ]);
    }
    if (promptSuffixOnFutureResult != null) {
      print('$prompt...${promptSuffixOnFutureResult(await future)}');
    } else {
      print('$prompt...$donePromptSuffix');
    }
    return future;
  }
}
