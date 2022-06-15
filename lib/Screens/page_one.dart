import 'package:ai_elements_task/Screens/page_two.dart';
import 'package:flutter/material.dart';
import '../Components/custom_text_field_num.dart';
import '../Components/prime_button.dart';
import '../Models/field_model.dart';
import '../Theme/app_colors.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  String firstValue = 'Text';
  List<String> options = [
    'Text',
    'Numbers',
    'Date',
  ];
  TextEditingController number = TextEditingController(text: "");
  FieldModel fieldModel =FieldModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText(title: "Number of Fields"),
            CustomTextFieldNumber(number: number,),
            const SizedBox(
              height: 16,
            ),
            titleText(title: "Select Data Type"),
            dataTypeDropDown(),
            const SizedBox(
              height: 32,
            ),

          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        color: AppColors.primeColor.withOpacity(0.1),
        child: InkWell(
            onTap:(){
              if(number.text!=""){
                setState((){
                  fieldModel.dataFieldType=firstValue;
                  fieldModel.numberOfFields=int.parse(number.text);
                  if(firstValue=="Date"){
                    fieldModel.setNumberOfDateTime();
                  }else{
                    fieldModel.setNumberOfControllers();
                  }
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  PageTwo(fieldModel: fieldModel, ),));
              }else{
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Number of Field is required")));
              }
            },
            child: const PrimeButton(label: 'Next',)),
      ),

    );
  }

  Widget titleText({required String title,  Color color=Colors.black}) => Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color:color),
      );

  Widget dataTypeDropDown()=>Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    margin: const EdgeInsets.symmetric(vertical: 4),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(3, 3),
              color: Colors.grey.shade200,
              blurRadius: 6)
        ]),
    child: DropdownButton(
      value: firstValue,
      underline: const SizedBox(),
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: options.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          firstValue = newValue!;
        });
      },
    ),
  );
}
