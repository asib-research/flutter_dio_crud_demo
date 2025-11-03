class ApiEndpoint{
  static String apiEndpoint = "https://jsonplaceholder.typicode.com/";
  static String getPosts = "$apiEndpoint/posts";
  static String getSinglePost(String id) => "$apiEndpoint/posts/$id";
  static String createPost = "$apiEndpoint/posts";
  static String updatePost(String id) => "$apiEndpoint/posts/$id";
  static String deletePost(String id) => "$apiEndpoint/posts/$id";
}