root.imagesScrollView = Titanium.UI.createScrollableView
	showPagingControl: true
	pagingControlHeight: 20

root.image1 = Titanium.UI.createImageView
	defaultImage: '/images/completo_loading.jpg'
	top: 0

root.image2 = Titanium.UI.createImageView
	defaultImage:  '/images/completo_loading.jpg'
	top: 0

root.image3 = Titanium.UI.createImageView 
	defaultImage: '/images/completo_loading.jpg'
	top: 0

root.image4 = Titanium.UI.createImageView 
	defaultImage: '/images/completo_loading.jpg'
	top: 0

root.image5 = Titanium.UI.createImageView 
	defaultImage: '/images/completo_loading.jpg'
	top: 0

root.imagesScrollView.addView(root.image1)
root.imagesScrollView.addView(root.image2)
root.imagesScrollView.addView(root.image3)
root.imagesScrollView.addView(root.image4)
root.imagesScrollView.addView(root.image5)

root.imagesRemove =  () ->
	root.imagesScrollView.removeView(root.image1)
	root.imagesScrollView.removeView(root.image2)
	root.imagesScrollView.removeView(root.image3)
	root.imagesScrollView.removeView(root.image4)
	root.imagesScrollView.removeView(root.image5)
	
root.imagesAdd = () ->
	root.imagesScrollView.addView(root.image1)
	root.imagesScrollView.addView(root.image2)
	root.imagesScrollView.addView(root.image3)
	root.imagesScrollView.addView(root.image4)
	root.imagesScrollView.addView(root.image5)