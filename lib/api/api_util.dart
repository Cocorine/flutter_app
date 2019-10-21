class ApiUtil{

  //static const String MAIN_API_URL="http://phplaravel-334244-1027441.cloudwaysapps.com/api";
  static const String MAIN_API_URL="http://192.168.42.230:8000/api";

  static const String ALL_CATEGORIES="/categories/";

  static const String ALL_TAGS="/tags";

  static const String ALL_AUTHORS="/authors";

  static const String ALL_POSTS="/posts";

  static String CATEGORY_POSTS(String categoryID){
    return MAIN_API_URL+ALL_CATEGORIES+categoryID+ALL_POSTS;
  }

  static String POST_DETAILS(String postID){
    return MAIN_API_URL+ALL_POSTS+postID;
  }

}