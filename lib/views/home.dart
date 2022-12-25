import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news/helper/data.dart';
import 'package:news/helper/news.dart';
import 'package:news/models/articale_model.dart';
import 'package:news/models/category_model.dart';
import 'package:news/views/article_view.dart';
import 'package:news/views/category_news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


List<CategoryModel> categories = <CategoryModel>[];

List<ArticaleModel> articles =  <ArticaleModel>[];

bool _loading = true;


 
  @override
  void initState() {
    super.initState();
    categories = getCategories(); 
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
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
        centerTitle: true,
        elevation: 0.0,
      ),

      body:_loading ? 
      Center(
        child: Container(
          child:const CircularProgressIndicator(),),
      ) 
        : SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding:const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [

              // categories
              Container(
                height: 70,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context , index){
                  return CategoryTile(
                    imageUrl: categories[index].imageUrl,
                    categoryName: categories[index].categoryName,
                    nameAr: categories[index].nameAr,
                  );
                }),
              ),

             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Container(
                padding:const EdgeInsets.symmetric(vertical: 5 , horizontal: 5),
                child:const Text('العناون الرئيسية', 
                style:TextStyle(
                  color: Colors.red,
                  fontSize: 25,
                  fontWeight: FontWeight.w900

                )),
              ),

              ],
             ),

              // blogs
              Container(
                padding:const EdgeInsets.only(top: 10),
                child: ListView.builder(
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
                ),
              
        
            ],
          ),
              ),
        ),
    );
  }
}


class CategoryTile extends StatelessWidget {
  final String imageUrl , categoryName , nameAr;
  const CategoryTile({super.key,required this.imageUrl,required this.categoryName, required this.nameAr});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => CategoryNews(
            category: categoryName.toLowerCase(),
            nameAr: nameAr,)
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          
      
          children: [
      
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl :imageUrl,
                // placeholder: (context, url) => CircularProgressIndicator(),
                // errorWidget: (context, url, error) => Icon(Icons.error),
                width: 120,
                height: 60,
                fit: BoxFit.cover,)
              ),
    
              Container(
                alignment: Alignment.center,
                width: 120, height: 60,
                decoration: BoxDecoration(
                  
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(6)
                ),
                child: Text(nameAr, style:const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 16),),
              )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl , title , desc ,url;
  const BlogTile({super.key , 
  required this.imageUrl , 
  required this.title , 
  required this.desc,
  required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context) => ArticleView(blogUrl: url) ));
      },
      child: Container(
        margin:const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl)),
            const SizedBox(height: 8,),
            
            Text(title,
            textDirection: TextDirection.rtl,
            style:const TextStyle(
              fontSize: 20 , 
              color: Colors.black87,
              fontWeight: FontWeight.w700,
              ),),
            
            const SizedBox(height: 8,),
            
            Text(desc ,
            textDirection: TextDirection.rtl,
            style:const TextStyle(color: Colors.black54))
          ],
        ),
      ),
    );
  }
}