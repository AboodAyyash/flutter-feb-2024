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




  
}
