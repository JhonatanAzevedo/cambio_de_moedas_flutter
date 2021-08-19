import 'package:conversor_moedas_curso/app/models/currency_model.dart';
import 'package:flutter/material.dart';


class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final void Function(CurrencyModel model,) onChanged;
  final CurrencyModel selectedItem;

  /* String dropvalue = 'Real'; */

  const CurrencyBox({Key? key, required this.controller, required this.items, required this.onChanged, required this.selectedItem}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 57,
          child: Expanded(
            flex: 1,
            child: DropdownButton<CurrencyModel>(
              iconEnabledColor: Colors.amber,
              //isExpanded: true,
              value: selectedItem,
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
              .toList(),
              
              onChanged: print , //<==== ainda vou resolver!!!
              /* value: dropvalue,
              items: <String>[
                'Real',
                'Dolar'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {},

              /* onChanged: (String? newValue) {
                         setState(() {
                           dropvalue = newValue!;
                         });
                       }, */ */
            ),
          ),
        ),
        SizedBox(width: 80),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
