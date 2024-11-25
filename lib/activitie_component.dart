import 'package:flutter/material.dart';
import 'package:horas_complementares/actitivies_detail_page.dart';

class ActivitieComponent extends StatelessWidget {
  const ActivitieComponent(
      {super.key,
      required this.title,
      required this.workload,
      required this.status,
      required this.icon,
      required this.textColor});

  final String title;
  final String workload;
  final String status;
  final IconData icon;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ActitiviesDetailPage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF9B1536),
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 0.5],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Carga horária: $workload',
                      style: const TextStyle(
                          fontSize: 14, color: Color.fromARGB(255, 91, 91, 91)),
                    ),
                    Row(
                      children: [
                        Text(
                          status,
                          style: TextStyle(color: textColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(
                            icon,
                            size: 16,
                            color: textColor,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
