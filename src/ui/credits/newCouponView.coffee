root.newCouponView = Titanium.UI.createView
	height:80
	borderWidth:0
	boderColor: 'grey'
	top: 0

newCuponTable = Titanium.UI.createTableView
	top: 37
	height: 30
	width: 120
	left: 140
	borderRadius: 10
	scrollable: false
	moving: false
	backgroundColor: '#fff'
	color:'#336699'
	
root.codeText = Titanium.UI.createTextField
	backgroundColor: '#fff'
	width: '90%'
	height: '90%'
	color:'#336699'
	hintText: L('code')
	clearOnEdit: true
	paddingLeft: 10
	returnKeyType: Titanium.UI.RETURNKEY_DONE

data = []
row = Titanium.UI.createTableViewRow
	width: '100%'
	height: 30
row.add(root.codeText)
data.push(row)
newCuponTable.data = data

	

root.codeText.addEventListener 'return', (e) ->
	Ti.API.info 'Entra en return validar con code = ' + root.codeText.value
	root.showLoading(root.creditsWindow)
	root.validateCoupon(root.codeText.value)

introCodeTitle = new root.GenericBlueTitleLabel(5,10,L('have_coupon_code') ).label
introCode = new root.GenericTextLabel(40,10,L('enter_code')).label


root.newCouponView.add(introCodeTitle)
root.newCouponView.add(introCode)
root.newCouponView.add(newCuponTable)