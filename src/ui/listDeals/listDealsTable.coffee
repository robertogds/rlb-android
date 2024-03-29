root.dealsTable = Titanium.UI.createTableView
  data: [Ti.UI.createTableViewRow({title:'Loading...'})]
  backgroundColor: '#0d1e28'
  separatorColor: '#1b3c50'

root.dealsTable.setData([Ti.UI.createTableViewRow({title:'Loading...'})])

root.listDealsWindow.add(root.dealsTable)

root.reloadDeals = false

root.why3Row = new root.GenericTextRow().row
root.why3Row.hasChild = true
root.why3Row.rightImage = '/images/blue_arrow.png'
textLabel = Titanium.UI.createLabel
	text: L('why3Title')
	color: '#fff'
	font:
		fontSize: 14
		fontWeight: 'bold'
	left: 10
root.why3Row.add(textLabel)

root.createDealsListener = (table) ->
	table.addEventListener 'click', (e) ->
		if e.row.deal is undefined
			root.tabGroup.activeTab.open(root.why3Window,{animated:true})
		else
			root.showDealView(e.row.deal)
			root.tabGroup.activeTab.open(root.oneDealWindow,{animated:true})

root.showDeals = (deals) ->
	Ti.API.info 'START******* llamando showDeals'
	root.listDealsWindow.remove(root.dealsTable)
	Ti.API.info "Entra en showDeals: " + deals.length		
	if deals.length is 0 
		root.showNoDeals()
	else 
		Ti.API.info '*** Entra en hay hoteles'
		Ti.API.info '*** Paso 1'
		root.tabGroup.activeTab.open(root.listDealsWindow,{animated:true})
		root.dealsTable = Titanium.UI.createTableView()
		root.createDealsListener(root.dealsTable)
		root.listDealsWindow.add(root.dealsTable)
		Ti.API.info '*** Paso 2'
		if root.cityHasZones(deals)
			root.populateDealsZoneTable(deals)
		else 
			root.populateDealsTable(deals)
	Ti.API.info '*** Sale de showDeals'


root.cityHasZones = (deals) ->
	lastName = "null"
	zonas = 0
	for deal in deals
		if deal.city.name isnt lastName
			zonas++
		lastName = deal.city.name
	if zonas > 1 
		return true
	else return false
		

root.populateDealsTable = (deals) ->
	Ti.API.info '*** Entra en populateDealsTable'
	root.dealsData = []
	for deal in deals
		dealRow = new root.listDealsRow(deal)
		root.dealsData.push(dealRow.row)
	root.dealsData.push(root.why3Row)
	root.endPopulate()

root.populateDealsZoneTable = (deals) ->
	Ti.API.info '*** Entra en populate Zonas '
	#root.zoneUrl = 'null'
	root.dealsData = []	
	lastName = "empty"
	first = true
	section = Titanium.UI.createTableViewSection()
	for hotel in deals
		root.dealRow = new root.listDealsRow(hotel).row
		header = null
		headerText = null
		Ti.API.info 'Entra deal ' + hotel.id
		if hotel.city.name isnt lastName
			Ti.API.info 'Entra en es CABECERA'
			if first isnt true
				Ti.API.info 'Entra en zona: ' + hotel.city.name
				root.dealsData.push(section)
			#header = new root.dealHeaderView(hotel.id).view
			first = false
			section = Titanium.UI.createTableViewSection
				headerTitle: hotel.city.name			
		section.add(root.dealRow)	
		lastName = hotel.city.name
	root.dealsData.push(section)		
	root.dealsData.push(root.why3Row)		
	#root.dealsTable.setData(root.dealsData)
	root.endPopulate()
	Ti.API.info '*** fin populateDealsZoneTable'

root.endPopulate = () ->
	Ti.API.info '*** Entra enPopulate'	
	root.dealsTable.setData(root.dealsData)
	root.hideLoading()
	Ti.API.info '*** FIN enPopulate'
	
root.loadDeals = (city) ->
	Ti.API.info 'START******* Entra en loadDeals'
	root.showLoading(root.listDealsWindow,L('updatingHotels'))
	root.city = city
	root.listDealsWindow.title = city.name
	root.noDealsWindow.title = city.name
	root.fetchDeals(city)



  



