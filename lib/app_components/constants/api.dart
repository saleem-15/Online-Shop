import 'package:dio/dio.dart';
import 'package:my_shop/storage/my_shared_pref.dart';

const apiUrl = 'http://192.168.56.1/laravel9/e-commerce/public/api';
const apikey = 'p@ssword123';

//auth
const signIn = '/Auth/user/login';
const signUp = '/Auth/user/register';
const logout = '/Auth/user/logout';
const checkisEmailUsed = '/Auth/user/email';

//category
const getAllCategories = '/category/index';

//products
const getAllProducts = '/product/index';
const getProductDetails = '/product/show/';
const getCategoryProducts = '/category/show';

//orders
const getAllUserOrders = '/product/index';
const addOrder = '/product/index';
const updateOrder = '/product/index';

//profile
const updateUserInfo = '/user/update';

//cart
const getAllUserCartItems = '/cart/product/index';
const addProductToCart = '/product/index';
const updateCartItem = '/product/index';
const deleteCartItem = '/product/index';

//shipping address
const getAllUserShippingAddresses = '/user/address/index';
const addShippingAddress = '/user/address/store';
const deleteShippingAddress = '/product/index';
const updateShippingAddress = '/product/index';

//search
const search = '/product/index';

final dio = Dio(
  BaseOptions(
    baseUrl: apiUrl,
    headers: {
      'apiKey': apikey,
      'Authorization': 'Bearer ${MySharedPref.getToken}',
    },
  ),
);
