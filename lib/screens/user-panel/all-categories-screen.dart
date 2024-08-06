

import "package:cached_network_image/cached_network_image.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:image_card/image_card.dart";
import "../../models/categories-model.dart";
import "../../utils/app-constant.dart";
import "single-category-products-screen.dart";

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        centerTitle: true,
        title: Text(
          "All Categories",
          style: TextStyle(
            color: AppConstant.appTextColor,
          ),
        ),
      ),
    body : FutureBuilder(
    future: FirebaseFirestore.instance.collection('categories').get(),
    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){

    if(snapshot.hasError){
    return Center(
    child: Text("Error"),
    );
    }

    if(snapshot.connectionState == ConnectionState.waiting){
    return Container(
    height : Get.height / 5,
    child: Center(
    child: CupertinoActivityIndicator(),
    ),
    );
    }

    if(snapshot.data!.docs.isEmpty){
    return Center (
    child: Text("No Category Found"),
    );
    }

    if(snapshot.data != null) {
      return GridView.builder(

        itemCount: snapshot.data!.docs.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2.0, // Reduced spacing between rows
          crossAxisSpacing: 2.0, // Reduced spacing between columns
          childAspectRatio: 1.0,
        ),
        itemBuilder: (context, index) {
          CategoriesModel categoriesModel = CategoriesModel(
            categoryId: snapshot.data!.docs[index]['categoryId'],
            categoryImg: snapshot.data!.docs[index]['categoryImg'],
            categoryName: snapshot.data!.docs[index]['categoryName'],
            createdAt: snapshot.data!.docs[index]['createdAt'],
            updatedAt: snapshot.data!.docs[index]['updateAt'],
          );
          return Row(
            children: [
              GestureDetector(
                onTap: (){
                  Get.to( () => AllSingleCategoryProductsScreen(
                      categoryId: categoriesModel.categoryId));
                },
                child: Padding(
                  padding: EdgeInsets.only(left : 20.0),
                  child: Container(
                    child: FillImageCard(
                      borderRadius: 8.0,
                      width: Get.width / 2.5,
                      heightImage: Get.height / 6.0,
                      imageProvider: CachedNetworkImageProvider(
                        categoriesModel.categoryImg,
                      ),
                      title: Center(
                        child: Text(categoriesModel.categoryName,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    return Container();
    },
    ),
    );
  }
}

