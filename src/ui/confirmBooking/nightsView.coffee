root.nightsView = Titanium.UI.createView
  backgroundColor:'#0d1e28'
  width: Ti.Platform.displayCaps.platformWidth

nightsTitleLabel = Titanium.UI.createLabel
  top: 5
  height: 22
  text: L('addNights')
  left: 8
  color: '#fff'
  font:
    fontSize: 16
    fontWeight: 'bold'

root.nightsView.add(nightsTitleLabel)

checkinTitleLabel = Titanium.UI.createLabel
  text: L('checkin') + ': '
  color: '#fff'
  font:
    fontSize: 14
    fontWeight: 'bold'
  left: 10
  height: 20
  top: 40

checkoutTitleLabel = Titanium.UI.createLabel
  text: L('checkout') + ': '
  color: '#fff'
  font:
    fontSize: 14
    fontWeight: 'bold'
  left: 10
  height: 20
  top: 62

nightsCheckinLabel = Titanium.UI.createLabel
  color: '#868d92'
  font:
    fontSize: 14
  left: 90
  top: 40
  height: 20

nightsCheckoutLabel = Titanium.UI.createLabel
  color: '#868d92'
  font:
    fontSize: 14
  left: 90
  top: 62
  height: 20

totalLabel = Titanium.UI.createLabel
  top: 40
  height: 10
  text: L('total')
  left: 240
  color: '#868d92'
  font:
    fontSize: 10
    fontWeight: 'bold'

nightsTotalLabel = Titanium.UI.createLabel
  text: '129€'
  color: '#fff'
  font:
    fontSize: 26
    fontWeight: 'bold'
  left: 240
  height: 30
  top: 45

night1View = new root.GenericNightView(1,100,20)
night1View.view.visible = true
night1View.view.backgroundColor = '#017096'
night1View.view.backgroundGradient =
  type:'linear'
  colors:[{color:'#0098cb',position:0.1},{color:'#017096',position:1.0}]
night1View.view.borderWidth = 2
night1View.dayOfWeekLabel.color = '#fff'
night1View.dateLabel.color = '#fff'
night1View.priceLabel.color = '#fff'

night1View.view.addEventListener 'click', (e) ->
  root.checkoutDate = new Date(root.checkinDate.getTime() + 86400000)
  root.bookingNights = 1
  root.totalPrice = root.deal.salePriceCents
  nightsTotalLabel.text = root.totalPrice + ' €' 
  pullButton(night2View)
  pullButton(night3View)
  pullButton(night4View)
  pullButton(night5View)

night2View = new root.GenericNightView(2,100,110) 
night2View.view.addEventListener 'click', (e) ->
  pushButton(night2View)
  pullButton(night3View)
  pullButton(night4View)
  pullButton(night5View)

night3View = new root.GenericNightView(3,100,200) 
night3View.view.addEventListener 'click', (e) ->
  pushButton(night2View)
  pushButton(night3View)
  pullButton(night4View)
  pullButton(night5View)
	
night4View = new root.GenericNightView(4,200,20) 
night4View.view.addEventListener 'click', (e) ->
  pushButton(night2View)
  pushButton(night3View)
  pushButton(night4View)
  pullButton(night5View)

night5View = new root.GenericNightView(5,200,110) 
night5View.view.addEventListener 'click', (e) ->
  pushButton(night2View)
  pushButton(night3View)
  pushButton(night4View)
  pushButton(night5View)

root.nightsView.add(night1View.view)
root.nightsView.add(night2View.view)
root.nightsView.add(night3View.view)
root.nightsView.add(night4View.view)
root.nightsView.add(night5View.view)


root.nightsView.add(nightsCheckoutLabel)
root.nightsView.add(nightsCheckinLabel)
root.nightsView.add(checkinTitleLabel)
root.nightsView.add(checkoutTitleLabel)
root.nightsView.add(nightsTotalLabel)
#root.nightsView.add(totalLabel)
root.nightsWindow.add(root.nightsView)

confirmButton = new root.GenericButton(310,L('save')).button 
confirmButton.addEventListener 'click', (e) ->
  root.nightsWindow.close()
root.nightsView.add(confirmButton)

pushButton = (nightView)->
  nightView.view.borderWidth = 2
  nightView.view.backgroundGradient = 
    type:'linear'
    colors:[{color:'#0098cb',position:0.1},{color:'#017096',position:1.0}]
  nightView.view.backgroundColor = '#017096'
  root.checkoutDate = new Date(root.checkinDate.getTime() + (86400000 * nightView.view.id))
  root.bookingNights = nightView.view.id
  nightView.dayOfWeekLabel.color = '#fff'
  nightView.dateLabel.color = '#fff'
  nightView.priceLabel.color = '#fff'
  switch nightView.view.id 
    when 2
      root.totalPrice = root.deal.salePriceCents + root.deal.priceDay2
    when 3
      root.totalPrice = root.deal.salePriceCents + root.deal.priceDay2 + root.deal.priceDay3
    when 4
      root.totalPrice = root.deal.salePriceCents + root.deal.priceDay2 + root.deal.priceDay3 + root.deal.priceDay4
    when 5
      root.totalPrice = root.deal.salePriceCents + root.deal.priceDay2 + root.deal.priceDay3 + root.deal.priceDay4 + root.deal.priceDay5
  nightsCheckoutLabel.text = root.getLocaleDateString(root.checkoutDate)
  nightsTotalLabel.text = root.totalPrice + ' €'

pullButton = (nightView)->
  nightView.view.borderWidth = 1
  nightView.view.backgroundGradient = 
    type:'linear'
    colors:[{color:'#ededed',position:0.1},{color:'#c2c1c1',position:1.0}]
  nightView.view.backgroundColor = '#c2c1c1'
  nightView.dayOfWeekLabel.color = '#000'
  nightView.dateLabel.color = '#000'
  nightView.priceLabel.color = '#000'
  nightsCheckoutLabel.text = root.getLocaleDateString(root.checkoutDate)

root.loadNightsView = ()->
  nightsTotalLabel.text = root.totalPrice + ' €'
  nightsCheckinLabel.text = root.getLocaleDateString(root.checkinDate)
  nightsCheckoutLabel.text = root.getLocaleDateString(root.checkoutDate)
  night1View.dayOfWeekLabel.text = root.getDayOfWeekString(root.checkinDate)
  night1View.dateLabel.text = root.getShortMonthString(root.checkinDate) + ' ' + root.checkinDate.getDate()
  night1View.priceLabel.text = root.deal.salePriceCents + ' €'

  if root.deal.priceDay2 > 0
    day2 = new Date(root.checkinDate.getTime() + 86400000 )
    night2View.dayOfWeekLabel.text = root.getDayOfWeekString(day2)
    night2View.dateLabel.text = root.getShortMonthString(day2) + ' ' + day2.getDate()
    night2View.priceLabel.text = root.deal.priceDay2 + '€'
    night2View.view.visible = true
  else night2View.view.visible = false

  if root.deal.priceDay3 > 0
    day3 = new Date(root.checkinDate.getTime() + 86400000 * 2)
    night3View.dayOfWeekLabel.text = root.getDayOfWeekString(day3)
    night3View.dateLabel.text = root.getShortMonthString(day3) + ' ' + day3.getDate()
    night3View.priceLabel.text = root.deal.priceDay3 + '€'
    night3View.view.visible = true
  else night3View.view.visible = false
    
  if root.deal.priceDay4 > 0
    day4 = new Date(root.checkinDate.getTime() + 86400000 * 3)
   	night4View.dayOfWeekLabel.text = root.getDayOfWeekString(day4)
    night4View.dateLabel.text = root.getShortMonthString(day4) + ' ' + day4.getDate()
    night4View.priceLabel.text = root.deal.priceDay4 + '€'
    night4View.view.visible = true
  else night4View.visible = false

  if root.deal.priceDay5 > 0
    day5 = new Date(root.checkinDate.getTime() + 86400000 * 4)
    night5View.dayOfWeekLabel.text = root.getDayOfWeekString(day5)
    night5View.dateLabel.text = root.getShortMonthString(day5) + ' ' + day5.getDate()
    night5View.priceLabel.text = root.deal.priceDay5 + '€'
    night5View.view.visible = true
  else night5View.visible = false
  