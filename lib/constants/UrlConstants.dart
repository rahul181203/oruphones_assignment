class UrlConstants{
  static String getListings(int page, int limit){
    return "https://dev2be.oruphones.com/api/v1/global/assignment/getListings?page=${page}&limit=${limit}";
  }
  static String getFilters(bool isLimited) {
      return "https://dev2be.oruphones.com/api/v1/global/assignment/getFilters?isLimited=${isLimited}";
  }
  static String searchModel = "https://dev2be.oruphones.com/api/v1/global/assignment/searchModel";
}