import 'package:UI/config/palette.dart';
import 'package:UI/config/styles.dart';
import 'package:UI/data/data.dart';
import 'package:UI/widgets/country_dropdown.dart';
import 'package:UI/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String _country="USA";
  @override
  Widget build(BuildContext context) {
    final screenHieght=MediaQuery.of(context).size.height;
    return Scaffold(
    appBar: CustomAppBar(),
    body:CustomScrollView(physics: ClampingScrollPhysics(),
    slivers: [
   _buildHeader(screenHieght),
   _buildPreventionTips(screenHieght),
      _buildYourOwnTest(screenHieght),
      
      
          ],
      ),
      
          );
        }
      
        SliverToBoxAdapter _buildHeader(double screenHeight){
      
          return SliverToBoxAdapter(
            child:Container(padding: const EdgeInsets.all(20),
            
            decoration: BoxDecoration(color:Palette.primaryColor,
            
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            
            ),
            
            
            
            ),
           
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget> [
      
                        Text("COVID-19",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 25
                        
                        ),
                        
                        ),
                        CountryDropdown(
      
                            countries: ['CN','FR','IN','IT','UK','USA'],
                            country: _country,
                            onChanged: (val)=>setState(()=>_country=val),
      
                        ),
                      ],
                ),
                SizedBox(height: screenHeight*0.03,),
                Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget> [
      
                  Text('Are you felling  sick?',style:TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600)
                  ),
                  SizedBox(height: screenHeight*0.01),
                  Text('If you feel sick with any COVID-19 symptoms,please call or text us immediately for help',style:TextStyle(color:Colors.white70,fontSize: 12,fontWeight: FontWeight.w600)),
                      SizedBox(height: screenHeight*0.01),
                      
                      Row(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget> [
                        
      
                        FlatButton.icon(
                         
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          onPressed: (){}, 
                          color: Colors.red,
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          icon:
                                Icon(Icons.phone,color: Colors.white,
                                ),
                           textColor: Colors.white, 
                           label: Text("Call Now",style:Styles.buttonTextStyle),
                        ), 
                        
                          FlatButton.icon(
                          
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          onPressed: (){},
                          color: Colors.blue,
                       
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)
                                
                                      ),
                          icon:
                                   Icon(Icons.chat_bubble,color: Colors.white,
                                           ),
                         
                          label: Text("Send SMS",style:Styles.buttonTextStyle),
                         textColor: Colors.white, 
                        ),
      
                      ],
                      )
      
                ],
                
                )
      
              ],
            ) ,
            ),
            
          
      );
           
        }
        SliverToBoxAdapter _buildPreventionTips(double screenHeight){
          
          return SliverToBoxAdapter(
            child:Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget> [
                  Text("Prevention Tips",style:TextStyle(fontSize: 22,fontWeight: FontWeight.w600)),
                  SizedBox(height: 20,),
                  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:prevention.map((e) => Column(children:<Widget> 
                          
                          [
                              Image.asset(e.keys.first,height: screenHeight*0.12,),
                              SizedBox(height: screenHeight*0.015,),
                              Text(e.values.first,style:TextStyle(fontSize: 16,fontWeight: FontWeight.w500),textAlign:TextAlign.center,),
                          
                      
                          ],
                          )
                          ).toList(),
                  )
      
                ],
              ),
            ),
          );
        }
      
         SliverToBoxAdapter  _buildYourOwnTest(double screenHieght) {
            return SliverToBoxAdapter(
                   child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          padding: EdgeInsets.all(10),
                        
                          height: screenHieght*0.15,
                          decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [Color(0xFFAD9FE4),Palette.primaryColor],
                                      ),
                            borderRadius: BorderRadius.circular(20),
                       

                     ),
                          child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: <Widget>[

                                          Image.asset("lib/assets/images/own_test.png"),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:<Widget> [
                                              
                                            Text("Do your own test!",style:TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                                            SizedBox(height: screenHieght*0.01,),
                                            Text("Follow the instruction\nto do your own test.",style:TextStyle(color:Colors.white,fontSize:16),  maxLines:2,),
                       


                                          ],)
                                        ],

                             ),
                   ),

            );

         }
}