// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:contact_book_ui_app/contact_details_view.dart';

import 'contact_details_view.dart';
import 'contact_list.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> data = [
    {
      "name": "Adam Aseidu",
      "phone": "+233 597 897 678",
      "country": "Ghana",
      "email": "adamaseidu@gmail.com",
      "region": "Accra",
    },
    {
      "name": "Abrah Noni",
      "phone": "+233 244 890 456  ",
      "country": "Ghana",
      "email": "abrahnoni@gmail.com",
      "region": "Accra",
      "picture":"assets/2.jpg"
    },
    {
      "name": "Bernice Nunu",
      "phone": "+233 567 456 789",
      "country": "Ghana",
      "email": "bernicenunu@ gmail.com",
      "region": "Wielkopolskie",
      "picture": "assets/3.jpg"
    },
    {
      "name": "Ben Osei",
      "phone": "+233 277 894 785",
      "country": "United States",
      "email": "benosei@gmail.com",
      "region": "New York",
      "picture": "assets/4.jpg"
    },
    {
      "name": "Crystal Stars",
      "phone": "+233 278 987 900",
      "country": "India",
      "email": "crystalstars@gmail.com",
      "region": "Punjab",
      "picture": "assets/5.jpg"
    },
    {
      "name": "Cindy Aboakye",
      "phone": "(675) 775-1127",
      "country": "United States",
      "email": "cindyaboakye@gmail.com@",
      "region": "Las Vegas",
      "picture": "assets/6.jpg"
    },
    {
      "name": "Iris Naa Mensah",
      "phone": "+233 243 678 908",
      "country": "Ghana",
      "email": "irisnaa@gmail.com",
      "region": "Kantamanso", 
      "picture": "assets/7.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child:const  Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'My Contact',
          //Googlefonts.montserrat(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Search by name or number',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.all(16),
          children: [
           const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recents',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return  ListTile(
                    onTap: () {
                      Navigator.push(context,
                       MaterialPageRoute(builder: (context) {
                         return ContactDetailsView(
                           contact: Contact(
                             country: 'Ghana',
                             email: 'irismensah@gmail.com',
                             phone: '+233 56 789 678 67',
                             region: 'Greater Accra', name: ''));
                        
                       }));
                     },
                    leading:const  CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/1.jpg'),
                    ),
                    title:const Text(
                      'Iris Mensah',
                      style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle:const Text('+233 678 789 90'),
                    trailing:
                        const IconButton(onPressed: null, icon: Icon(Icons.more_horiz)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 5,
                    endIndent: 5,
                    thickness: 2,
                  );
      
                },
                  
                itemCount: 3),
           const Padding(
               padding: EdgeInsets.symmetric(horizontal: 16),
               child: Text(
                 'Contacts',
                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String,String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                         MaterialPageRoute(builder: (context) {
                           return ContactDetailsView(
                             contact: contact,
                           );
                         }));
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/2.jpg'),
                      ),
                      title: Text(
                        '${element['name']}',
                        style:const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                         subtitle: Text('${element['phone']}'),
                         trailing:const  IconButton(
                           onPressed: null, icon: Icon(Icons.more_horiz)),
                         ),
                         const Divider(
                           indent: 5,
                           endIndent: 5,
                           thickness: 2,
                         )
                       ],
                      );
                    },
                    itemComparator: (item1, item2)  =>
                       item1['name']!.compareTo(item2['name']!),
                    useStickyGroupSeparators: true,
                    order: GroupedListOrder.ASC,
            ),
          ],
                     
        ),
      ),
    );
  }
}