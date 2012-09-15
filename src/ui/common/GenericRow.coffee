class GenericRow
	constructor: (text) ->
		@label = Titanium.UI.createLabel
			width: Ti.UI.FILL
			height: Ti.UI.FILL
			text: text
			left: 8
			color: '#000'
			backgroundColor: '#fff'
			font:
				fontSize: 15
				fontWeight: 'bold'
		@row = Titanium.UI.createTableViewRow
			hasChild:true
			rightImage: '/images/right_arrow3.png'
			width: Ti.UI.FILL
			height: 44
		@row.add(@label)
root.GenericRow = GenericRow