

int countAge(DateTime birthDate, DateTime today) {
  return today.difference(birthDate).inDays ~/ 365 ;
}

void main() {
  DateTime today = DateTime.now();
  Duration myAge = Duration(days: 6938); 
  print(today.subtract(myAge));
  // DateTime birthDate = DateTime(2004,DateTime.january , 9);
}

  // print(today.month);
  // print(birthDate);
  // print("umur saya ${countAge(birthDate, today)}");
