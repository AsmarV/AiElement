import 'package:ai_elements_task/Screens/page_one.dart';
import 'package:flutter/material.dart';

import '../Components/prime_button.dart';
import '../Models/field_model.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key, required this.fieldModel}) : super(key: key);
  final FieldModel fieldModel;

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third page"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              InkWell(
                  onTap: ()=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const PageOne(),), (route) => false),
                  child: const PrimeButton(label: 'Create new form',)),
              
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.fieldModel.numberOfFields,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
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
                    child: Center(
                      child: Text(widget.fieldModel.dataFieldType=="Date"?widget.fieldModel.dates[index].toString().substring(0,10):widget.fieldModel.controllers[index].text,style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900
                      ),),
                    ),
                  );
                },),
            ],
          ),
        ),
      ),

    );
  }


}
