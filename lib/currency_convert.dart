import 'package:flutter/material.dart';

//1. Create a variable that stores the converted curreny value
//2. Create a function that multiplies the value given by the textfield
//3. To store the value that we created
//4. display the variable

class CurrencyConvert extends StatefulWidget {
  const CurrencyConvert({super.key});

  @override
  State<CurrencyConvert> createState() => _CurrencyConvert();
}

class _CurrencyConvert extends State<CurrencyConvert> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  List<String> list = <String>['usd', 'yen', 'euro', 'rupee'];
  String s1 = 'usd';
  String s2 = 'usd';
  String s3 = '0';

  @override
  Widget build(BuildContext context) {
    print('rebuilt');
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: BorderRadius.circular(5),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Currency Converter',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: const [Icon(Icons.home)],
        leading: const Icon(Icons.menu),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(4),
              child: Text(
                s3, // output
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 255, 255, 1)),
              ),
            ),
            //padding
            //Container
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                decoration: InputDecoration(
                  hintText: 'Enter the amount in USD',
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(5, 5, 5, 1),
                  ),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.lightGreen,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'From   ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 110, 230, 110),
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255,
                        255), // Background color of the dropdown icon
                    borderRadius: BorderRadius.circular(5), // Rounded corners
                  ),
                  child: DropdownButton(
                      dropdownColor: const Color.fromARGB(255, 255, 255, 255),
                      iconEnabledColor:
                          const Color.fromARGB(255, 110, 230, 110),
                      value: s1,
                      items: list
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: const TextStyle(),
                                ),
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          s1 = val.toString();
                        });
                      }),
                ),
                const Text(
                  '    To   ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 110, 230, 110),
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255,
                        255), // Background color of the dropdown icon
                    borderRadius: BorderRadius.circular(5), // Rounded corners
                  ),
                  child: DropdownButton(
                      dropdownColor: const Color.fromARGB(255, 254, 254, 254),
                      iconEnabledColor:
                          const Color.fromARGB(255, 110, 230, 110),
                      iconSize: 24,
                      elevation: 16,
                      value: s2,
                      items: list
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: const TextStyle(),
                                ),
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          s2 = val.toString();
                        });
                      }),
                ),
              ],
            ),

            //Button
            //Raised Button- kind of like
            //Appears like a text

            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                  onPressed: check,
                  style: ElevatedButton.styleFrom(
                    elevation: 15,
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Convert',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void check() {
    Map<String, double> conversionRates = {
      'usd-usd': 1.0,
      'usd-rupee': 83.7,
      'usd-yen': 149.12,
      'usd-euro': 0.93,
      'rupee-usd': 1 / 83.7,
      'rupee-rupee': 1.0,
      'rupee-yen': 1.78,
      'yen-usd': 1 / 149,
      'yen-rupee': 1 / 1.78,
      'yen-yen': 1.0,
      'yen-euro': 0.006,
      'euro-usd': 1 / 1.08,
      'euro-rupee': 90.38,
      'euro-yen': 169.0,
      'euro-euro': 1.0,
    };

    String key = '$s1-$s2';
    double conversionRate = conversionRates[key] ?? 0.0;
    if (conversionRates.containsKey(key)) {
      double result = double.parse(textEditingController.text) * conversionRate;

      setState(() {
        textEditingController.text = '';
        s3 = '${result.toStringAsFixed(2)} $s2';
      });
    } else {
      print('Invalid conversion');
    }
  }
}
