import 'package:even_odd/view/base/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/dimensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> getEvenNumbers() {
    return [for (int i = 2; i <= 100; i += 2) i];
  }

  List<int> getOddNumbers() {
    return [for (int i = 1; i <= 99; i += 2) i];
  }

  List<int> evenNumbers = [];
  List<int> oddNumbers = [];

  @override
  void initState() {
    setState(() {
      evenNumbers = getEvenNumbers();
      oddNumbers = getOddNumbers();
    });
    super.initState();
  }

  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Get.theme.primaryColor,
        title: Text(
          "Home",
          style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.fontSizeLarge,
              fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Get.theme.cardColor,
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Button(
                    title: "Even Number",
                    onTap: () {
                      setState(() {
                        myIndex = 0;
                      });
                    },
                    color: Colors.green,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Button(
                  title: "Odd Number",
                  onTap: () {
                    setState(() {
                      myIndex = 1;
                    });
                  },
                  color: Colors.red,
                )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Get.theme.primaryColor,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault),
                    ),
                    child: Center(
                      child: Text(
                        myIndex == 0
                            ? evenNumbers[index].toString()
                            : oddNumbers[index].toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                itemCount:
                    myIndex == 0 ? evenNumbers.length : oddNumbers.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
