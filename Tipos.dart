import 'asyncProgramming.dart';
import 'streams.dart';


makeCoffee(String coffee, [String dairy]) {
  if(dairy != null)
    print('$coffee with $dairy');
  else
    print( 'Black $coffee');
}

enum Proceso{ Ready, Resume, Paused, Terminated}

switchCondition(Proceso proceso){
  switch (proceso) {
    case Proceso.Resume:
    case Proceso.Ready:
      print("run()");
      break;
    case Proceso.Paused:
      print("pause()");
      break;
    case Proceso.Terminated:
      print("stop()");
      break;
    default: print("unknown()");
  }
}

typedef F = List<T> Function<T>(T);
typedef void LoggerOutputFunction(String msg);

class Logger {
  LoggerOutputFunction out;
  Logger() {
    out = print;
  }
  void log(String msg) {
    out(msg);
  }
}

void timestampLoggerOutputFunction(String msg) {
  String timeStamp = new DateTime.now().toString();
  print('${timeStamp}: $msg');
}

void mainTipos() {
  // print("hola");
  int a;
  print(a?? 0);
  print(a); 
  a = 12;
  if(a is int )
    print("es entero");
  double b = 15.5;
  String sc = '234';
  int c = int .parse(sc);
  print(c);

  //int? nullable = 10;
  //int nonNullable = nullable ?? 0;
  
  switchCondition(Proceso.Resume);
  
  //
  //
  //makeCoffee('cafe', null );

  int max = 10;
  var M = [ -1, for(int  i = 0; i < max; ++i ) i, -1];
  print(M);

  for(int  i = 0; i < max; i++ )
    print(i);

  Set<int> primos = {17, 2, 3, 5, 11, 13};
  primos.add(13);
  print(primos);
  var listallaves = {2,3,4};
  var listacorchetes = [2, 3, 4];
  print(listallaves);
  print(listacorchetes);
  print(listallaves.runtimeType);
  print(listacorchetes.runtimeType);
  for(final item in listallaves)
    print(item);

  //primos.sort();
  M.sort();

  final List<String> fruits = <String>['bananas', 'apples', 'oranges'];

  print(fruits..sort());
  fruits.sort((a, b) => 1 > 0 ? 1:0);
  print(fruits);


  Logger l = new Logger();
  l.log('Hello World');
  l.out = timestampLoggerOutputFunction;
  l.log('Hello World');
}


void main() async {
  //funcionFutura(20000, 20000);
  //funcionFutura(20, 20);
  //futureChain();
  //funcionThen();

  final stream = randomNumbers();
  await for(var value in stream){
    print(value);
    // este delay nop afecta a la impresion de los datos de forma normal
    await Future.delayed(Duration(seconds: 5));
  }


  /* final streamSync = randomNumbersSync();
  for(var value in streamSync){
    print(value);
  } */

  /* await for(var c in counterStream()){
    print(c);
  } */
}