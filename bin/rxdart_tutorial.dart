import 'dart:async';

import 'package:rxdart/rxdart.dart';

void main() {
  // biến này để làm cột mốc thời gian lúc bắt đầu run chương trình
  var currentTime = DateTime.now();

  //var mergeStream = MergeStream([firstStream(), secondStream()]);
  var mergeStream = Rx.merge([firstStream(), secondStream()]); // truyền 2 stream vào đây để merge lại
  mergeStream.listen((event) => println(event, currentTime));
}

// stream 1
Stream<int> firstStream() async* {
  await Future.delayed(Duration(seconds: 1)); // 1s sau sẽ emit event đầu tiên
  yield 20; // emit 20 vào giây thứ 1
  await Future.delayed(Duration(seconds: 1)); // nghỉ 1 giây
  yield 40; // emit 40 vào giây thứ 2
  await Future.delayed(Duration(seconds: 2));
  yield 60; // emit 60 vào giây thứ 4
  await Future.delayed(Duration(seconds: 6));
  yield 80; // emit 80 vào giây thứ 10
  await Future.delayed(Duration(seconds: 3));
  yield 100; // emit 100 vào giây thứ 13
}

// stream 2
Stream<int> secondStream() async* {
  await Future.delayed(Duration(seconds: 7)); // sau 7s sẽ emit event đầu tiên
  yield 1;
  await Future.delayed(Duration(seconds: 9));
  yield 1;
}

// mình sử dụng hàm println này để in kèm thời điểm emit event cho dễ quan sát output
void println(Object value, DateTime currentTime) {
  print('Emit $value vào giây thứ ${DateTime.now().difference(currentTime).inSeconds}');
}
