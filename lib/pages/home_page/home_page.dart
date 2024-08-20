import 'package:flutter/material.dart';
import 'package:neon_banking/pages/home_page/widgets/menu_holder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 255, 253, 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      size: 24,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '21th May, 2020',
                    ),
                    Text(
                      'Hello, SamMuigai',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MenuItem(
                    icon: 'lib/assets/user_account.png',
                    title: 'My Account',
                    color: Color.fromRGBO(237, 228, 255, 1),
                    subTitle: 'All Accounts',
                  ),
                  MenuItem(
                    icon: 'lib/assets/profile.png',
                    title: 'My Profile',
                    color: Color.fromRGBO(248, 249, 212, 1),
                    subTitle: 'View Profile',
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MenuItem(
                    icon: 'lib/assets/cil_transfer.png',
                    title: 'My Transfers',
                    color: Color.fromRGBO(255, 234, 233, 1),
                    subTitle: 'Acc to acc',
                  ),
                  MenuItem(
                    icon: 'lib/assets/money_exchange.png',
                    title: 'Mobile Money',
                    color: Color.fromRGBO(227, 237, 255, 1),
                    subTitle: 'Mpesa Transaction',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
