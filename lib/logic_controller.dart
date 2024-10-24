import 'package:get/get.dart';

class LogicController extends GetxController {
  var show = '0'.obs;
  String operand1 = '';
  String operand2 = '';
  String operator = '';
  String result = '';

  bool isOperator(String oprtr) {
    return oprtr == '/' || oprtr == 'x' || oprtr == '-' || oprtr == '+' || oprtr == '=';
  }

  void pressedButton(String buttonText) {
    if (buttonText == 'C') {
      clear();
    } else if (isOperator(buttonText)) {
      handleOperator(buttonText);
    } else {
      handleOperand(buttonText);
    }
  }

  void clear() {
    show.value = '0';
    operand1 = '';
    operand2 = '';
    operator = '';
    result = '';
  }

  void handleOperator(String buttonText) {
    if (operator.isEmpty) {
      operator = buttonText;
      operand1 = show.value;
      show.value = '0';
    } else {
      operand2 = show.value;
      result = calculate();
      show.value = result;
      operator = (buttonText == '=') ? '' : buttonText;
    }
  }

  void handleOperand(String buttonText) {
    if (show.value == '0' || result.isNotEmpty) {
      show.value = buttonText;
      result = '';
    } else {
      show.value += buttonText;
    }
  }

  String calculate() {
    double num1 = double.parse(operand1);
    double num2 = double.parse(operand2);
    double result = 0;

    switch (operator) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case 'x':
        result = num1 * num2;
        break;
      case '/':
        if (num2 == 0) {
          return 'undefined'; 
        }
        result = num1 / num2;
        break;
    }

    if (result % 1 == 0) {
      return result.toInt().toString(); 
    } else {
      return result.toStringAsFixed(2); 
    }
  }
}
