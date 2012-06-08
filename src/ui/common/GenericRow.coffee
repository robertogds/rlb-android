class GenericRow
	constructor: (text) ->
		@label = Titanium.UI.createLabel
			width: '100%'
			height: '100%'
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
			width: '100%'
			height: 44
		@row.add(@label)
root.GenericRow = GenericRow