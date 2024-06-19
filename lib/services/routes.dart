class Routes {
  static const url = 'http://192.168.140.238:3000/';

  static const createUser = "${url}registerUser";
  static const loginUser = "${url}loginUser";

  static const addProductRoute = "${url}product/addproduct";
  static const getProductRoute = "${url}product/getproducts";
  static const updateProductRoute = "${url}product/updateProducts/";
  static const deleteProductRoute = "${url}product/deleteProducts/";
  static const orderProductRoute = "${url}product/orderProduct/";
}
