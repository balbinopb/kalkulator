import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalkulator/app_pallete.dart';
import 'logic_controller.dart';
import 'kalkulator_button.dart';


class Kalkulator extends StatelessWidget {
  final LogicController controller = Get.put(LogicController());

  final List<String> buttons = [
    'C', '+/-', '%', '/',
    '7', '8', '9', 'x',
    '4', '5', '6', '-',
    '1', '2', '3', '+',    
  ];

  Kalkulator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 113,
              ),
              Container(
                height: 173,
                alignment: Alignment.bottomRight,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                child: Obx(() {
                  return Text(
                    controller.show.value,
                    style: const TextStyle(color: AppPallete.textColor, fontSize: 48),
                    textAlign: TextAlign.right,
                  );
                }),
              ),
              
              // Button grid
              Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppPallete.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            itemCount: buttons.length, //what is this for
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (context, idx) {                          
                              return CalculatorButton(
                                text: buttons[idx],
                                color: controller.isOperator(buttons[idx]) ? AppPallete.operatorColor : AppPallete.notOperatorColor,
                                textColor: AppPallete.textColor,
                                onPressed: () {
                                  controller.pressedButton(buttons[idx]);
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 7),
                          child: Row(                            
                            children: [                  
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  height: 80,
                                  child: CalculatorButton(
                                    text: '0',
                                    color: AppPallete.notOperatorColor,
                                    textColor: AppPallete.textColor,
                                    onPressed: () {
                                      controller.pressedButton('0');
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 80,
                                  child: CalculatorButton(
                                    text: '.',
                                    color: AppPallete.notOperatorColor,
                                    textColor: AppPallete.textColor,
                                    onPressed: () {
                                      controller.pressedButton('.');
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 80,
                                  child: CalculatorButton(
                                    text: '=',
                                    color: AppPallete.operatorColor,
                                    textColor: AppPallete.textColor,
                                    onPressed: () {
                                      controller.pressedButton('=');
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
