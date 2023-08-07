import 'package:flutter/material.dart';
import 'package:multi_app/components/menuBar.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';


class NavBarComp extends StatelessWidget{

  @override 
  Widget build(BuildContext context){
    return const Scaffold();
  }


  AppBar? navBar(BuildContext context, bool isVisible) {
    return isVisible
      ?AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset('images/logo.jpg', width: MediaQuery.of(context).size.width/3.5),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          // IconButton(
          //   icon: const Icon(Icons.menu),
          //   onPressed: () {},
          // ),
        ]
      )
      :null;
  }


  BottomNavigationBar bottomNavBar(BuildContext context, int currentIndex) {
    return BottomNavigationBar(
      fixedColor: Colors.blue,
      unselectedItemColor: Colors.black45,
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      onTap: (int index){},
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Acceuil'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Etudiant'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Scolarite'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule),
          label: 'Presences'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Bulletin de notes'
        ),
      ],
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
      accountName: Text('NGO NJIKI Ruth'),
      accountEmail: Text('Parent de: SAMNICK Ruth'), 
    );
  }
}