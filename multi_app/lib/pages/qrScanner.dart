
import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:multi_app/components/menuBar.dart';
import 'package:multi_app/components/navBar.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

NavBarComp navBarComp = NavBarComp();


class qrScannerPage extends StatefulWidget {
  const qrScannerPage({super.key, required this.title});
  final String title;

  @override
  State<qrScannerPage> createState() => _qrScannerPageState();
}

class _qrScannerPageState extends State<qrScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _controller;
  String _qrCode = 'No scan';
  
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.

  @override
  void dispose(){
    // _controller?.dispose();
    super.dispose();
    // if(Platform.isAndroid){
    //   qrController!.pauseCamera();
    // } else if(Platform.isIOS){
    //   qrController!.resumeCamera();
    // }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MenuBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: _buidQRView(context),
            ),
            // ElevatedButton(
            //   onPressed: () {scanQRCode();} ,
            //   child: Text('QR Sacnner')),
            Text(_qrCode)
          ],
        ),
      ),
    );
  }


  Widget _buidQRView (BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _showQRViewCreated
    );
  }

  void _showQRViewCreated(QRViewController controller){
    setState () => _controller = controller;

    _controller!.scannedDataStream.listen((scannedData){
      _qrCode = scannedData.toString();
      print(scannedData);
    });
  }


  // void scanQRCode() async{
  //   try{
  //     final qrCode = await FlutterBarcodeScanner.scanBarcode('#1A307C', 'Cancel', true, ScanMode.BARCODE);

  //     if (!mounted) return;

  //     setState(() {
  //       _qrCode = qrCode;
  //     });
  //     print('QRCode: ');
  //     print(_qrCode);
  //   } on Exception{
  //     print(_qrCode);
  //     print('Failed');
  //   }
  // }


}




