import 'dart:async';

import 'dart:math';


//https://www.woolha.com/tutorials/rxdart-using-subject-publish-behavior-replay


class RandomStream {
  final int maxValue;
  static final _random = Random();

  Timer _timer;
  //late se usa para datos que seran asignados despues
  int _currentCount;

  StreamController<int> _controller;

  RandomStream({this.maxValue = 100}){
    _currentCount = 0;
    _controller = StreamController<int>(
      onListen: _startStream,
      onResume: _startStream,
      onPause: _stopTimer,
      onCancel: _stopTimer

    );
    //_timer = Timer.periodic(const Duration(seconds: 1), _runStream);

    //si el timer hubiera esatado aca el stream comenzariana  emitir cuando la calse se crea
    
  }
  ///a reference to the random number stream
  Stream<int> get stream => _controller.stream;

  void  _startStream(){
    _timer = Timer.periodic(const Duration(seconds: 1), _runStream);
    _currentCount = 0;
  }

  void _stopTimer(){
    _timer?.cancel();
    _controller.close();
  }

  void _runStream(Timer timer){
    _currentCount++;
    int value = _random.nextInt(maxValue);
    print('se agrego e valor $value al stream');
    _controller.add(value);
    if(_currentCount == maxValue){
      _stopTimer();
    }
  }
}

void main() async{

  final stream = RandomStream().stream; //aca el stre  ya esta entreagndo datos
  await Future.delayed(const Duration(seconds: 2));
  //el estos 2 segundos ya tendara 2 numeros
  final subscription = stream.listen((int random) { //un suscriptor recien se esta poneindo a la escucha
    print(random);
  });

  await Future.delayed(const Duration(milliseconds: 3200));
  subscription.cancel();

}
