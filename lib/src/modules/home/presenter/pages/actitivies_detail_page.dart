import 'dart:convert';
import 'dart:io';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/models/activity_model.dart';
import '../widgets/pick_pdf_widget.dart';

class ActivitiesDetailPage extends StatefulWidget {
  final ActivityModel activity;

  const ActivitiesDetailPage({
    super.key,
    required this.activity,
  });

  @override
  State<ActivitiesDetailPage> createState() => _ActivitiesDetailPageState();
}

class _ActivitiesDetailPageState extends State<ActivitiesDetailPage> {
  bool isLoadingFile = true;
  File file = File('');

  @override
  void initState() {
    super.initState();

    getFileFromBase64(widget.activity.base64File).then((file) {
      setState(() {
        this.file = file;
        isLoadingFile = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoadingFile) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Visualizar Atividade',
            style: context.texts.headingH6.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Visualizar Atividade',
          style: context.texts.headingH6.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DetailsItem(
                icon: Icons.description,
                label: 'Título',
                value: widget.activity.title,
              ),
              SizedBox(height: 16),
              _DetailsItem(
                icon: Icons.timer,
                label: 'Carga horária',
                value: '${widget.activity.workload} horas',
              ),
              SizedBox(height: 16),
              _DetailsItem(
                icon: Icons.category,
                label: 'Categoria',
                value: widget.activity.category.name,
              ),
              SizedBox(height: 16),
              _DetailsItem(
                icon: Icons.description,
                label: 'Descrição',
                value: widget.activity.description,
              ),
              SizedBox(height: 16),
              PickPdfWidget(
                initialFile: file,
                onPickPdf: (file) {},
                isViewOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<File> getFileFromBase64(String base64) async {
    final bytes = base64Decode(base64);
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/temp.pdf');

    await file.writeAsBytes(bytes);

    return file;
  }
}

class _DetailsItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailsItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: CatolicaColors.primary700,
          size: 28,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: context.texts.paragraphSmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: CatolicaColors.primary700,
                ),
              ),
              Text(
                value,
                style: context.texts.paragraphSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
