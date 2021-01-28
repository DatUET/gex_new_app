import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/core/model/article.dart';
import 'package:getx_news_app/core/widget/drawer.dart';
import 'package:getx_news_app/feature/news_headline/controller/news_headline_controller.dart';

class NewHeadlineView extends StatelessWidget {

  final controller = Get.find<NewsHeadlineController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Headline'),
      ),
      drawer: getAppDrawer(),
      body: Obx(
          () {
            return controller.isLoading.isTrue ? Center(
              child: CircularProgressIndicator(),
            ) :
            Container(
                margin: EdgeInsets.all(10.0),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    Article article = controller.articles[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        article.imageUrl == null
                            ? Container()
                            : Image.network(article.imageUrl),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          article.title,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(article.desc),
                      ],
                    );
                  },
                  separatorBuilder: (context, indeex) => Divider(),
                  itemCount: controller.articles.length,
                ),
              );
          }
      ),
    );
  }
}
