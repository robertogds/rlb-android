class GenericTitleLabel
	constructor: (top,left,text) ->
		@label = Titanium.UI.createLabel
			text: text
			width: Ti.UI.FILL
			textAlign: 'left'
			height: Ti.UI.SIZE
			left: left
			top: top
			color: '#ffff'
			font:
				fontSize: 20
				fontWeight: 'bold'
		
root.GenericTitleLabel = GenericTitleLabel