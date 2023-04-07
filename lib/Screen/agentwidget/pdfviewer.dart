import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

String pdfpath = "", pdfname = "";

class PDFViewer extends StatefulWidget {
  // final String name;

  const PDFViewer({
    super.key,
  });

  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
          title: Text(
            pdfname,
            style: const TextStyle(color: Colors.black),
          ),
          foregroundColor: primary,
        ),
        body: pdfpath == ""
            ? const Center(
                child: Text("No Pdf Open"),
              )
            : SfPdfViewer.network(pdfpath));
  }
}
