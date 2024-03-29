import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_util.dart';
import 'package:news_app_mobile/models/category.dart';
import 'package:news_app_mobile/models/post.dart';
class CategoriesApi{

    // DECLARATION OF VARIABLE

    Category category; //OBJET CATEGORY
    List<Category> categories=[]; //LIST OF CATEGORIES

    Post post; //OBJET POST
    List<Post> categoryPosts=[]; //LIST OF POSTS

    var uriResponse; // GET A RESPONSE OF REQUEST
    http.Client client; // THIS IS A HTTP CLIENT

    String uriRequest;

    // FUNCTON FOR GET ALL CATEGORIES
    Future<List<Category>> fetchAllCategories() async{

        // HTTP REQUEST URI
        uriRequest=ApiUtil.MAIN_API_URL+ApiUtil.ALL_CATEGORIES;

        // HTTP REQUEST HEADERS
        Map<String,String> headers={
            'Accept' : 'application/json',
            'Content-Type' : 'application/json',
        };

        client = new http.Client();

        try {
             uriResponse = await client.get(uriRequest,headers: headers);

            if(uriResponse.statusCode==200){

                Map<String,dynamic> body=jsonDecode(uriResponse.body);

                if(body.isEmpty){
                    print('No record');
                }

                // LOADING CATEGORIES DATA IN LIST OF CATEGORIES
                for( var item in body['data']){
                    category=Category.fromJson(item);
                    categories.add(category);
                }

            }else{
                print('error');
            }

            return categories;

        } finally {
          client.close();
        }

    }

    Future<List<Post>> fetchPostsForCategory(String categoryID) async{

            uriRequest=ApiUtil.CATEGORY_POSTS(categoryID);

            Map<String,String> headers={
                'Accept' : 'application/json',
                'Content-Type' : 'application/json',
            };

            client = new http.Client();

            try {
                uriResponse = await client.get(uriRequest,headers: headers);

                if(uriResponse.statusCode==200){

                    Map<String,dynamic> body=jsonDecode(uriResponse.body);

                    if(body.isEmpty){
                        print('No record');
                    }

                    for( var item in body['data']){
                        post=Post.fromJson(item);
                        categoryPosts.add(post);
                    }

                }else{
                    print('error');
                }
                return categoryPosts;
            }
            finally {
                client.close();
            }

    }
}