class OtherCityRow
	constructor: (city) ->
		@row = Ti.UI.createTableViewRow
			hasChild: true
			height: 30
			rightImage: '/images/grey_arrow.png'
			backgroundGradient: root.bgGradient
			city: city
		cityLabel = Titanium.UI.createLabel
			text: city.name
			color: '#fff'
			font:
				fontSize: 12
				fontWeight: 'bold'
			left: 10
		@row.add(cityLabel)
	
root.OtherCityRow = OtherCityRow