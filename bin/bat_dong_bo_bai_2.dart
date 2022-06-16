import 'dart:async';

Stream<int> makeNumberStream() {
  return Stream<int>.periodic(Duration(seconds: 3), makeNumberUp);
}

int makeNumberUp(int countNumber) {
  return countNumber;
}

void readStream({required Stream<int> numberStream}) {
  StreamSubscription? checkStream;
  checkStream = numberStream.listen((number) {
    number+=1;
    if (number < 100) {
      if (number % 3 == 0) {
        print('Số chia hết cho 3:$number');
      }
    } else {
      checkStream?.cancel();
    }
  });
}

void main(List<String> arguments) async {
  Stream<int> numberStream = makeNumberStream();
  readStream(numberStream: numberStream);
}
