// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:lottie/lottie.dart';

// import '../../../models/product_preview.dart';
// import '../../home/components/product_tile.dart';
// import '../search_controller.dart';

// class Results extends GetView<SearchController> {
//   const Results({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 15.w),
//       child: Obx(
//         () => Column(
//           children: [
//             /// result counter
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   '${controller.isLoading.isTrue ? 'Searching' : 'Results'} for "${controller.searchTextController.text}" ',
//                   style: Theme.of(context).textTheme.headline6,
//                 ),
//                 Text(
//                   '${controller.numOfResults} found',
//                   style: Theme.of(context).textTheme.bodyLarge,
//                 ),
//               ],
//             ),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10.w),
//                 alignment: const Alignment(0, -.5),
//                 child: controller.isLoading.isFalse && controller.numOfResults != 0
//                     ? PagedGridView<int, ProductPreview>(
//                         showNewPageProgressIndicatorAsGridChild: false,
//                         showNewPageErrorIndicatorAsGridChild: false,
//                         showNoMoreItemsIndicatorAsGridChild: false,
//                         pagingController: pagingController,
//                         builderDelegate: PagedChildBuilderDelegate<ProductPreview>(
//                           itemBuilder: (context, item, index) => ProductTile(
//                             product: pagingController.itemList![index],
//                           ),
//                           noItemsFoundIndicatorBuilder: (context) => const CircularProgressIndicator(),
//                           firstPageErrorIndicatorBuilder: (context) =>
//                               Text(pagingController.error.toString()),
//                           firstPageProgressIndicatorBuilder: (context) {
//                             return Column(
//                               children: [
//                                 LottieBuilder.asset(
//                                   'assets/no_result_found.json',
//                                   height: 200.sp,
//                                 ),
//                                 Text(
//                                   'Sorry, The keyword you entered cannot be found, please search with another keyword.',
//                                   style: Theme.of(context).textTheme.bodyText2!.copyWith(
//                                         fontSize: 16.sp,
//                                         height: 1.5,
//                                       ),
//                                 ),
//                               ],
//                             );
//                           },
//                           newPageErrorIndicatorBuilder: (context) => const Text('coludnt load'),
//                           noMoreItemsIndicatorBuilder: (context) =>
//                               const Center(child: Text('There is no more products')),
//                         ),
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 8.w,
//                           mainAxisSpacing: 10.sp,
//                           //  height of each tile
//                           mainAxisExtent: 200.sp,
//                         ),
//                       )
//                     : SingleChildScrollView(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             /// loading state
//                             if (controller.isLoading.isTrue) LottieBuilder.asset('assets/searching3.json'),

//                             /// empty state
//                           ],
//                         ),
//                       ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// //                               if (controller.isLoading.isFalse && controller.numOfResults == 0)
