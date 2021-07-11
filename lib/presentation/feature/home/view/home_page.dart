import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/entities/article.dart';
import '../controller/home_controller.dart';
import 'detail_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        child: controller.obx(
          (state) => ListView.builder(
            itemCount: state!.length,
            itemBuilder: (context, index) {
              final article = state[index];
              return NewCard(article: article);
            },
          ),
          onEmpty: Center(child: Text('No news today')),
          onError: (_) => Center(child: Text('Somethings went wrong!')),
          onLoading: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Today News'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            controller.getNews();
          },
          icon: Icon(
            Icons.refresh,
          ),
        )
      ],
    );
  }
}

class NewCard extends StatelessWidget {
  const NewCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Get.to(() => DetailPage(article: article)),
      child: Card(
        elevation: 5,
        child: Container(
          child: Column(
            children: [
              article.urlToImage.isNotEmpty
                  ? Container(
                      height: Get.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(article.urlToImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      article.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    article.description.isNotEmpty
                        ? Divider(color: Colors.black)
                        : SizedBox.shrink(),
                    Text(
                      article.description,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
