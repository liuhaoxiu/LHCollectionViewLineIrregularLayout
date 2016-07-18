#LHCollectionViewLineIrregularLayout
##继承UICollectionViewLayout，Cell可以动态指定高度和纵横Item间距，暂时提供两种布局逻辑，方便扩展。
####LHCollectionViewLineIrregularLayoutDefault样式（通过线性布局，一行占满就开启另外一行排布，总是按数据顺序从左到右排列）
![](https://github.com/liuhaoxiu/LHCollectionViewLineIrregularLayout/raw/master/default.gif)

##Installation
		pod 'LHCollectionViewLineIrregularLayout', '~> 0.0.2'
		
##Requirements
* iOS 6.0+
* ARC
		
##Usage
###Programatically
创建一个LHCollectionViewLineIrregularLayout类的实例并设置它的属性到你想要的值.

		LHCollectionViewLineIrregularLayout *collectionViewLineIrregularLayout = [LHCollectionViewLineIrregularLayout new];
		collectionViewLineIrregularLayout.columnWidth = 80.0;
		collectionViewLineIrregularLayout.interitemSpacing = 20.0;
		collectionViewLineIrregularLayout.verticalInteritemSpacing = 20.0;
		collectionViewLineIrregularLayout.collectionViewLineIrregularLayoutStyle = self.collectionViewLineIrregularLayoutStyle;
##Contact
hao liu
* [http://liuhaoxiu.github.io](http://liuhaoxiu.github.io)




