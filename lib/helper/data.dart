import 'package:news/models/category_model.dart';

List <CategoryModel> getCategories (){

  List<CategoryModel> myCategories = <CategoryModel>[];
  CategoryModel categoriesModel;

  //1
  categoriesModel =  CategoryModel();
  categoriesModel.categoryName = "Business";
  categoriesModel.nameAr = "أقتصاد";
  categoriesModel.imageUrl = "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  myCategories.add(categoriesModel);

  //2
  categoriesModel =  CategoryModel();
  categoriesModel.categoryName = "Entertainment";
  categoriesModel.nameAr = "ترفيه";
  categoriesModel.imageUrl = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categoriesModel);

  //3
  categoriesModel =  CategoryModel();
  categoriesModel.categoryName = "General";
    categoriesModel.nameAr = "معلومات عامة";
  categoriesModel.imageUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  myCategories.add(categoriesModel);

  //4
  categoriesModel =  CategoryModel();
  categoriesModel.categoryName = "Health";
    categoriesModel.nameAr = "صحة";
  categoriesModel.imageUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  myCategories.add(categoriesModel);

  //5
  categoriesModel =  CategoryModel();
  categoriesModel.categoryName = "Science";
    categoriesModel.nameAr = "علوم";

  categoriesModel.imageUrl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  myCategories.add(categoriesModel);

  //5
  categoriesModel =  CategoryModel();
  categoriesModel.categoryName = "Sports";
      categoriesModel.nameAr = "رياضة";

  categoriesModel.imageUrl = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categoriesModel);

  //5
  categoriesModel =  CategoryModel();
  categoriesModel.categoryName = "Technology";
  categoriesModel.nameAr = "تكنولوجيا";

  categoriesModel.imageUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categoriesModel);

  return myCategories;
 

}

