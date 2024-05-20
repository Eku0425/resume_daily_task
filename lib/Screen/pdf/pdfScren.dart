import 'package:flutter/material.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    returnScaffold(
      appBar: AppBar(title: Text('pdf'),),
      body: PdfPreview(
        pdfPreviewPageDecoration: BoxDecoration(color: Colors.white,),
        build: (format) => generatePdf(),
      ),

    );
}
