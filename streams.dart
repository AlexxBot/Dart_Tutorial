import 'dart:io';

import 'dart:math';

final stream = Stream<double>.fromIterable(const <double>[1.0,23,10,234,34,43]);

Iterable<int> randomNumbersSync() sync *{
  final random = Random();

  for(int i = 0; i<100; i++){
    sleep(Duration(seconds: 1));
    yield random.nextInt(50) + 1 ;
  }
}

Stream<int> randomNumbers() async * {
  final random = Random();

  for(int i = 0; i<100; i++){
  // este delay no afecta en nada al stream
    await Future.delayed(Duration(seconds: 1));
    yield random.nextInt(50) + 1;
  }
}


Stream<int> counterStream([int maxCount = 1000]) async * {
  final delay = const Duration(seconds: 1);
  var count = 0;

  while(true){
    if(count == maxCount){
      break;
    }
    await Future.delayed(delay);
    yield ++count;
  }
}
