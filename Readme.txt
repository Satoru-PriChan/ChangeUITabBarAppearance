ChangeUITabBarAppearance: The sample project that shows how you change the shape, the color, the image of a UITabbar. (Swift5 iOS)

It uses CAShapeLayer, UIBezierPath. 

The most tricky point is UIImage.init(colorPattern:). You can use this function to set an image into CAShapeLayer. An image file is used upside down in runtime. So you have to turn it upside down in advance with a paint soft or something. Also, please note the image is put from at the top-left corner of the ORIGINAL(before expanded) layer . If you changed the way to expand CAShapeLayer, you should also adjust the content on the image file.

ChangeUITabBarAppearance: UITabBarの形、色、画像を変えるサンプルプロジェクトです。(Swift5, iOS)

CAShapeLayer, UIBeizierPathを使用しています。

一番わかりにくい点はUIImage.init(colorPattern:)です。このメソッドで画像をCAShapeLayerにセットしています。画像はランタイム時上下逆にして使われるので、画像編集ソフトなどで画像の内容をあらかじめ上下逆にしておいてください。また画像が貼られるのは「拡張前の」レイヤーの左上角からという点に注意してください。CAShapeLayerの拡張法を変えたい場合は、画像の中身も調整する必要があると思います。