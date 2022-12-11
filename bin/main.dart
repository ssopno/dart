void main() {
  //////String
  String name = 'shathi';
  print(name);
  //////integer
  int myAge = 30;
  print(myAge);

  /////Floting point
  double sscGpa = 4.69;
  print(sscGpa);

  //////camalcase
  //////boolean
  bool answer = true;
  print(answer);

  //////List
  List<String> myFriendName = [
    'iram',
    'shathi',
    'popy',
    'moni',
    'kobita',
    'alina',
    'miku'
  ];
  print(myFriendName[5]);

  List<int> ageOfFrnd = [25, 20, 24, 40, 50];
  print(ageOfFrnd[2]);
  List<double> resultOfFrnd = [4.5, 4.69, 4.25, 5.00];
  print(resultOfFrnd);

  /////Map
  /////keyvalue pair
  Map<int, int> keys = {1: 1, 2: 2, 3: 3, 4: 4};
  print(keys.values);
  Map<int, String> roomnumberOfFrnd = {
    1: 'Nila',
    2: 'alina',
    3: 'miku',
    4: 'miku'
  };
  print(roomnumberOfFrnd);
  print(roomnumberOfFrnd.keys);
  print(roomnumberOfFrnd.values);
  Map<String, String> phoneNumberOfFrind = {
    '015866665884': 'shathi',
    '015887799896': 'nila',
    '014896689676': 'miku'
  };
  print(phoneNumberOfFrind['015866665884']);
  print(phoneNumberOfFrind.keys);
  print(phoneNumberOfFrind);

  //////var
  //////String,int,double

  final myAnotherName = 'rafi';
  print(myAnotherName);

  const myAnotherFrnd = 'rafi';
  print(myAnotherFrnd);

  ///////opartion
  int a = 10;
  int b = 20;
  int c = a + b;
  print(c);
  int d = a - c;
  print(d);
  int f = a * b;
  print(f);
  int e = (a / b).toInt();
  print(e);

//////constant
  const double pi = 3.14592653589793;
  print(pi);

  // tomorrow will practice pre-recording video
}
