
Stream<int> makeNumberStream(){
  return Stream<int>.periodic(Duration(seconds: 3), makeNumberUp);
}
int makeNumberUp(int countNumber){
  if(countNumber<100){
    countNumber+=1;
    if(countNumber%3==0){
     print('Số chia hết cho 3:$countNumber');
    }
  }
  return countNumber;
} 

void readStream({required Stream<int> numberStream})
{
  numberStream.listen((number){
    //print(number);
});
}
void main(List<String> arguments) async{
   Stream<int> numberStream = makeNumberStream();
   readStream(numberStream: numberStream);
}


