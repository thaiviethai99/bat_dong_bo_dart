Future<String> showInfo({required String inputData, required int numberSecond}) {
  return Future.delayed(Duration(seconds: numberSecond), () {
    return inputData;
  });
}

void main(List<String> arguments) async {
  var name = await showInfo(inputData: 'Thái Việt Hải', numberSecond: 3);
  print('Họ tên:$name');

  var age = await showInfo(inputData: 34.toString(), numberSecond: 5);
  print('Tuổi:$age');

  var home = await showInfo(inputData: 'Bình Dương', numberSecond: 2);
  print('Quê quán:$home');
}
