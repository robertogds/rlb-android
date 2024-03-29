class CityCell
	constructor: (row,city,left) ->   
		@cityImage = Titanium.UI.createImageView
			image: city.image
			city: city
			left: left 
			width: root.anchoCities - 2
			height: root.anchoCities - 2
			open: false
			top:0
		@inactiveView = Titanium.UI.createView
			backgroundColor : '#0d1e28'
			opacity: 1
			height: root.anchoCities
			width: root.anchoCities
			visible: false
			top: 0
			left: left
			cityName: L('more_cities')

		moreCitiesLabel = Titanium.UI.createLabel
			text: L('view_all_cities')
			width: '90%'
			backgroundColor : '#0d1e28'
			textAlign: 'center'
			height: root.anchoCities
			top: 0
			color: '#d3d3d3'
			font:
				fontSize: 16
				fontWeight: 'bold'
		@inactiveView.add(moreCitiesLabel)
		
		borderView = Titanium.UI.createView
			backgroundColor : 'black'
			color: 'black'
			height: root.anchoCities
			width: root.anchoCities
			visible: true
			top: 0
			left: left

		@cityLabel = Titanium.UI.createLabel
			text: L(city.url)
			color: 'white'
			textAlign: 'center' 
			font:
				fontSize: 14
				fontWeight: 'bold'
			left: left 
			height:18
			width:root.anchoCities
			top: 88

		@cityBarLabel = Titanium.UI.createLabel
			borderWidth: 0
			backgroundColor: 'black'
			opacity: 0.3
			color: '#fff'
			left: left
			height: 18
			width: root.anchoCities
			top: 89

		row.add(borderView)
		row.add(@cityImage)
		row.add(@cityBarLabel)
		row.add(@cityLabel)
		row.add(@inactiveView)
		

		@inactiveView.addEventListener 'click', (e) ->
			root.showAllCities()
		@cityImage.addEventListener 'click', (e) ->
			Ti.API.info '*** Entra en click'
			city = e.source.city
			cell = root.cell[city.name]
			root.showLoading(root.citiesWindow,L('updatingHotels'))
			Ti.API.info '*** LLama a loadDeals'
			root.loadDeals(e.source.city)
		
root.cityCell = CityCell