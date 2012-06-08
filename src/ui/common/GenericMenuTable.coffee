class GenericMenuTable
	constructor: (top,rows) ->
		@view = Titanium.UI.createView
			background: 'transparent'
			top:top
		@table = Titanium.UI.createTableView
			top: 0
			height: 44 * rows 
			width: '95%'
			borderWidth:0
			borderRadius: 10
			scrollable: false
			moving: false
			backgroundColor: '#fff'
			data: []
		@section = Titanium.UI.createTableViewSection()
		@view.add(@table)
	setData: () ->
		data = []
		data.push(this.section)
		this.table.data = data
root.GenericMenuTable = GenericMenuTable
