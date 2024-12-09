import 'dart:io';

import 'package:design_system/design_system.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class PickPdfWidget extends StatefulWidget {
  final File? initialFile;
  final void Function(File fileImage) onPickPdf;
  final bool isEnable;
  final bool isViewOnly;
  final double radius;
  final String selectPdfText;
  final String changePdfText;
  final String viewPdfText;
  final String? Function(File?)? validator;

  const PickPdfWidget({
    super.key,
    required this.initialFile,
    required this.onPickPdf,
    this.isEnable = true,
    this.radius = 8,
    this.selectPdfText = 'Clique para adicionar o certificado',
    this.changePdfText = 'Clique para alterar o certificado',
    this.viewPdfText = 'Clique para visualizar o certificado',
    this.validator,
    this.isViewOnly = false,
  });

  @override
  State<PickPdfWidget> createState() => _PickPdfWidgetState();
}

class _PickPdfWidgetState extends State<PickPdfWidget> {
  File? file;

  @override
  void initState() {
    super.initState();

    file = widget.initialFile;
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      autovalidateMode: AutovalidateMode.disabled,
      validator: (_) => widget.validator?.call(file),
      builder: (field) {
        return Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            onTap: widget.isEnable ? onTap : null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TODO: Change this icon to a CatolicaIcon
                Visibility(
                  visible: file == null,
                  child: Icon(
                    Icons.upload_file,
                    size: 40,
                    color: CatolicaColors.neutral500,
                  ),
                ),
                Visibility(
                  visible: file != null,
                  child: Text(
                    (file?.path ?? '').split('/').last,
                    style: context.texts.paragraphSmall.copyWith(
                      color: CatolicaColors.neutral500,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Visibility(
                  visible: widget.isViewOnly,
                  child: Text(
                    getHint(file),
                    style: context.texts.paragraphSmall.copyWith(
                      color: CatolicaColors.neutral500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String getHint(File? file) {
    if (widget.isViewOnly) {
      return widget.viewPdfText;
    }

    return file == null ? widget.selectPdfText : widget.changePdfText;
  }

  Future<void> onTap() async {
    if (widget.isViewOnly) {
      return _isViewOnly();
    }

    return _pickFile();
  }

  Future<void> _isViewOnly() async {
    await OpenFile.open(file!.path);
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File convertedFile = File(result.files.single.path!);

      widget.onPickPdf.call(convertedFile);

      setState(() => file = convertedFile);
    }
  }
}
