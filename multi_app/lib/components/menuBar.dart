import 'package:flutter/material.dart';
import 'package:multi_app/main.dart';
import 'package:multi_app/pages/qrScanner.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';


class MenuBar extends StatefulWidget{

  @override
  State<MenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override 
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(  
        children: [
          const userAccount(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Homepage', style: TextStyle(fontSize: 17),),
            iconColor: Colors.black,
            textColor: Colors.black,
            onTap: (){
              Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_,__,___)=>const MyHomePage(title: 'Homepage')));
            },
          ),
          ListTile(
            leading: const Icon(Icons.qr_code_scanner),
            title: const Text('QR Code Scanner', style: TextStyle(fontSize: 17),),
            iconColor: Colors.black,
            textColor: Colors.black,
            onTap: (){
              Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_,__,___)=>const qrScannerPage(title: 'QR Code Scanner')));
            },
          ),

        ],
      ),
    );
  }
}


class userAccount extends StatefulWidget {
  const userAccount({
    Key? key,
  }) : super(key: key);

  @override
  State<userAccount> createState() => _userAccountState();
}

class _userAccountState extends State<userAccount> {
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      currentAccountPicture: CircleAvatar(
        child: ClipOval(
          child: Image.asset('images/contact.png',
              width: 200,  
              fit: BoxFit.cover)
        ),
      ),
      accountName: const Text('NGO NJIKI Ruth'),
      accountEmail: const Text('Parent de: SAMNICK Ruth'), 
    );
  }
}