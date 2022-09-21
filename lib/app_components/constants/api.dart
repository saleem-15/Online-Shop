import 'package:dio/dio.dart';
import 'package:my_shop/storage/my_shared_pref.dart';

late final apiUrl;
// const apiUrl = 'http://192.168.56.1:80/laravel9/e-commerce/public/api';
const apikey = 'p@ssword123';

//auth
const signIn = '/Auth/user/login';
const signUp = '/Auth/user/register';
const logout = '/Auth/user/logout';
const checkisEmailUsed = '/Auth/user/email';

//category
const getAllCategories = '/category';

//products
const getAllProducts = '/product';
const getProductDetails = '/product/';
const getCategoryProducts = '/category';

//orders
const getAllUserOrders = '/order';
const addOrder = '/order';
const updateOrder = '/product';
//
const checkout = '/cart/product/checkout';

//profile
const updateUserInfo = '/user/update';

//cart
const getAllUserCartItems = '/cart/product/index';
const addProductToCart = '/cart/product/store';
const updateCartItem = '/cart/product/update';
const deleteCartItem = '/cart/product/destroy';

//shipping address
const getAllUserShippingAddresses = '/user/address/index';
const addShippingAddress = '/user/address/store';
const deleteShippingAddress = '/user/address/destroy';
const updateShippingAddress = '/user/address/update';
const setShippingAddressAsDefault = '/user/address/default/set';

//shipping type
const getAllShippingTypes = '/shipping/type';

//search
const search = '/product/search';

final dio = Dio(
  BaseOptions(
    baseUrl: apiUrl,
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'apiKey': apikey,
      'Authorization': 'Bearer ${MySharedPref.getToken}',
    },
  ),
);
