import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news/helper/news.dart';
import 'package:news/models/articale_model.dart';
import 'package:news/views/home.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  final String nameAr;
  const CategoryNews({super.key,required this.category,required this.nameAr});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

List<ArticaleModel> articles =  <ArticaleModel>[];

bool _loading = true;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

   getCategoryNews() async {
    CategoriesNews newsClass = CategoriesNews();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Egy',style: TextStyle(color: Colors.black),),
            Text('News',style: TextStyle(color: Colors.red),)
          ],
        ),
        // centerTitle: true
        elevation: 0.0,
        leading:GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back , color: Colors.black,
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.save,color: Colors.black,),
          )
        ],
      ),

      body: _loading ? 
      const Center(
        child:CircularProgressIndicator()
      
      )
      : Container(
                padding:const EdgeInsets.symmetric(horizontal: 16 ,vertical: 5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      
                      Container(
                        padding:const EdgeInsets.all(10),
                        child: Text(
                          widget.nameAr,
                          style:const TextStyle(color: Colors.blue,fontSize: 25 ,fontWeight: FontWeight.bold),),
                      ),

                      ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics:const ClampingScrollPhysics(),
                    itemBuilder: (context , index){
                    return BlogTile(
                      imageUrl: articles[index].urlToImage, 
                      title: articles[index].title, 
                      desc: articles[index].description,
                      url: articles[index].url,);
                        
                  }
                  )
                    ],
                  ),
                )
                ),
    );
  }
}