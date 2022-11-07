import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/services.dart';

class ScannerQr extends StatefulWidget {
  const ScannerQr({super.key});

  @override
  State<ScannerQr> createState() => _ScannerQrState();
}

class _ScannerQrState extends State<ScannerQr> {
  ScanResult? _result;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _result == null
            ? const Text("Esperando Codigo Qr")
            : Column(
                children: [
                  Text('Contenido: ${_result?.rawContent}'),
                  Text('Formato: ${_result?.format.toString()}'),
                ],
              ),
        const SizedBox(height: 60),
        ElevatedButton.icon(
          onPressed: scan,
          icon: const Icon(Icons.camera),
          label: const Text('scanear'),
        ),
      ],
    );
  }

  Future scan() async {
    try {
      var barcode = await BarcodeScanner.scan();
      setState(() => _result = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          const Text("no se dio el acceso al uso de la camara.");
        });
      } else {
        setState(() {
          Text("error desconocido $e.");
        });
      }
    } on FormatException {
      setState(() {
        const Text("no se reconocio el qr.");
      });
    } catch (e) {
      setState(() {
        Text("error desconocido $e.");
      });
    }
  }
}
