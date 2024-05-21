import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice Screen'),
      ),
      body: Column(
        children: [
          ...List.generate(
              invoiceList.length,
              (index) => ListTile(
                    title: Text(invoiceList[index].name!),
                    subtitle: Text(invoiceList[index].price!),
                    trailing: Text(invoiceList[index].category!),
                  )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              invoiceList.add(InvoiceModel(
                  name: 'iphone', price: '50,000', category: 'phone'));
            },
          );
        },



        child: Icon(Icons.add),
      ),
    );
  }
}

List<InvoiceModel> invoiceList = [
  InvoiceModel(name: 'HP', price: '55000', category: 'laptop'),
];

class InvoiceModel {
  String? name;
  String? price;
  String? category;

  InvoiceModel({this.name, this.price, this.category});
}

Future<Uint8List> generatePdf() {
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) => pw.Row(children: [
        pw.SizedBox(
          height: 20
        ),
        pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: List.generate(
            invoiceList.length,
            (index) => pw.Text(
              '${invoiceList[index].name} ',
              style: pw.TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
        pw.SizedBox(width: 90),
        pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              invoiceList.length,
              (index) => pw.Text(
                '${invoiceList[index].price}',
                style: pw.TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
        pw.SizedBox(
          width: 90,
        ),
        pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              invoiceList.length,
              (index) => pw.Text(
                '${invoiceList[index].category}',
                style: pw.TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ]),
    ),
  );
  return pdf.save();
}
