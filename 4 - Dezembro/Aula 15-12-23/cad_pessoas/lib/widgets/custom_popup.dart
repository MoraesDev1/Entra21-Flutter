import 'package:cad_pessoas/pages/novo.dart';
import 'package:flutter/material.dart';

class CustomPopUp extends StatefulWidget {
  const CustomPopUp({super.key});

  @override
  State<CustomPopUp> createState() => _CustomPopUpState();
}

class _CustomPopUpState extends State<CustomPopUp> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) => print(value),
      itemBuilder: (context) => <PopupMenuEntry>[
        PopupMenuItem(
          value: 1,
          child: const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.edit,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 50,
                  ),
                  child: Text('Editar'),
                ),
              ],
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Novo(),
            ),
          ),
        ),
        PopupMenuItem(
          child: const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.delete,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 50,
                  ),
                  child: Text('Remover'),
                ),
              ],
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Novo(),
            ),
          ),
        ),
      ],
    );
  }
}
