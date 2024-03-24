void main() {
  print("Hello!");

  String s = "Ahmad";
  String e = "15";
  String w = "89";
  String t = "Amman";
  int i = 20;
  double d = 10.0;
  bool b = true; // false;
  var v = true;

  print(b);

  print("Hello Im $s I Live in $t my age = $i");

  //Numbers
  //Strings
  //Booleans
  //Lists (Array)
  //Maps {}
  //Null

  double x = i + 50 + d;
  print(x);
  x = 50;
  print(x);

  double price = 15.41530809;
  print(price.toStringAsFixed(2));

  String ar = """Hello Ahmad
Hello Ahmad
Hello Ahmad
Hello Ahmad
Hello Ahmad""";

  print(ar);

  int productPrice = 10;
  String productName = "Water";
  String bac = "\\";

  //this product name = Water\ 10 USD
  print("this product name = " +
      productName +
      "$bac " +
      productPrice.toString() +
      " USD");

  print("this product name = $productName$bac $productPrice USD");

  String tax = "1";
  double total = double.parse(tax) + productPrice; //String => Double
  print(total);

  String taxc = "1";
  int totalc = int.parse(taxc) + productPrice; //String => Int
  print(totalc);

  double taxx = 0.56;
  int totalx = taxx.toInt() + productPrice; //Double => Int
  print(totalx);

  int taxxx = 0;
  double totalxx = taxxx.toDouble() + productPrice; //Int => Double
  print(totalxx);

/* 
Block
Comment 
*/

  int num1 = 10;
  int num2 = 3;

  String ss = "10.0";

  double sum = num1 + double.parse(ss);

  print(sum);

  String str = " He llo e ";
  //.runtimeType (to get var type)
  print(str.isEmpty);
  print(str.isNotEmpty);
  print(str.length);
  print(str.toUpperCase());
  print(str.toLowerCase());

  print(str.trim());
  print(str.trim().length);

  print(str.trimLeft());
  print(str.trimLeft().length);

  print(str.trimRight());
  print(str.trimRight().length);

//  String str = " He llo e ";
  print(str.replaceAll("e", "g"));

  print(str.split('e'));
//$
  print(str.substring(4)); // == str.substring(4,str.length)
  print(str.substring(0, 5));

// Drawing the triangle
  for (int i = 1; i <= 5; i++) {
    // Printing spaces before each row
    for (int space = 1; space <= 5 - i; space++) {
      print(' ');
    }
    // Printing '*' for each row
    for (int j = 1; j <= 2 * i - 1; j++) {
      print('*');
    }
    // Moving to the next line
    print('');
  }

  String sp = "     ";

  for (var i = 5; i > 0; i--) {
    sp = sp.substring(0, i);
    for (var j = i; j >= i; j--) {
      switch (j) {
        case 5:
          print(sp + "*");
          break;
        case 4:
          print(sp + "***");
          break;
        case 3:
          print(sp + "*****");
          break;
        case 2:
          print(sp + "*******");
          break;
        case 1:
          print(sp + "*********");
          break;
      }
    }
  }

  int y = 0;
  for (int i = 0; i < 5; i++) {
    for (int j = i; j <= 11; j++) {
      print(" ");
      if (j == 5) {
        for (int num = 0; num <= y + y; num++) {
          print("*");
        }
      }
    }
    y++;
    print("");
  }

  String star = "*";
  String space = ' ';
  int count = 7;

  for (var i = 0; i < count; i++) {
    space = " ";
    for (var j = 0; j < (count - i); j++) {
      space += " ";
    }
    print(space + star + space);
    star += "**";
  }

  calcuate(x: 2, y: 5);
  double addData = add(5.0);
  print("addData $addData");

  List list = ["a", "b", "c", "d"]; // elemnts
  //0    1    2    3      indexes
  print(list);
  print(list[0]);
  print(list.length);
  for (var i = 0; i < list.length; i++) {
    print(list[i]);
  }

  Map m = {
    "USA": {
      'key5': "value1",
    },
    "key2": ["a", "b", "c", "d"],
    "key3": "value3",
    "key4": "value4",
  };
  List l = m['key2'];
  print(l);
  print(m.keys);

//Apple //Cir A >=
//Flutter (List, Map) Future

//SQlite

  Calcuater cal = Calcuater();
  cal.add(1, 5);
  cal.remove(5, 2);
  print(cal.x);
  print(cal.y);
}

void calcuate({required double x, double y = 0.0}) {
  print("Hello");
  print(x - y);
}

double add(double parameter1, [double parameter2 = 5.0]) {
  print("Add");
  print(parameter1 + parameter2);
  return parameter1 + parameter2;
}

class Calcuater {
  int x = 10;
  int y = 5;
  int _varName = 1;
  double add(double parameter1, double parameter2) {
    print("Add");
    print(parameter1 + parameter2);
    return parameter1 + parameter2;
  }

  double remove(double parameter1, double parameter2) {
    print("Remove");
    print(parameter1 - parameter2);
    return parameter1 - parameter2;
  }
}


//type functionName(parameter1, parameter2){ code }


//class className {}

 
