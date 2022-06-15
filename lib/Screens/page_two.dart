import 'package:ai_elements_task/Components/custom_text_field_num.dart';
import 'package:ai_elements_task/Components/custom_text_field_text.dart';
import 'package:ai_elements_task/Components/prime_button.dart';
import 'package:ai_elements_task/Models/field_model.dart';
import 'package:ai_elements_task/Theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'page_three.dart';


class PageTwo extends StatefulWidget {
  const PageTwo({Key? key, required this.fieldModel}) : super(key: key);
  final FieldModel fieldModel;

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.fieldModel.numberOfFields,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            switch(widget.fieldModel.dataFieldType){
              case "Text":
                return CustomTextFieldText(txt: widget.fieldModel.controllers[index]);
              case "Numbers":
                return CustomTextFieldNumber(number: widget.fieldModel.controllers[index]);
              case "Date":
                return InkWell(
                    onTap: (){
                      _selectDate(context, index);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(3, 3),
                                color: Colors.grey.shade200,
                                blurRadius: 6)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text( widget.fieldModel.dates[index].toString().substring(0,10),style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900
                          ),),
                          const Icon(Icons.date_range,color: Colors.deepPurple,)
                        ],
                      ),
                    ));

            }
            return const SizedBox();
        },),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        color: AppColors.primeColor.withOpacity(0.1),
        child: InkWell(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdPage(fieldModel: widget.fieldModel,),)),
            child: const PrimeButton(label: 'Save',)),
      ),
    );
  }



  Future<void> _selectDate(BuildContext context,index) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: widget.fieldModel.dates[index],
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != widget.fieldModel.dates[index]) {
      setState(() {
        widget.fieldModel.dates[index] = picked;
      });
    }
  }
}
