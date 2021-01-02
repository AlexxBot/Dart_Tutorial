//esta funcion evitara que la aplicaion se freezee y contienue con otras declaraciones
Future<int> funcionFutura(int a, int b) {
  int val = 0;
  for (int i = 0; i < a; i++) {
    for (int j = 0; j < b; j++) {
      val += i + j;
    }
  }
  print('termino para val = $val');
  return Future.value(val);
}
// cadena de futures , espera a que todos los futures terminen
Future<void> futureChain() async {
  Future<int> a = funcionFutura(100, 200);
  Future<int> b = funcionFutura(1000, 20000);
  Future<int> c = funcionFutura(10, 20);
  Future.wait<int>([a,b,c]).then((value) => print('${value[0]} , ${value[1]}, ${value[2]}'));
}

Future<int> sumaFutures(int a, int b) async{
  int primero = await Future.delayed( Duration(seconds: a), () => a );
  int segundo = await Future.delayed( Duration(seconds: b), () => b );
  return Future.value(primero + segundo);


}

void funcionThen(){
  sumaFutures(5, 2).then((suma) => print(suma));
  print('instruccion final');

}
