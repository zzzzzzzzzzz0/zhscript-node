var nn___ = window.Notification || window.mozNotification || window.webkitNotification
function nn__(s, title) {
	nn___.requestPermission()
	new nn___(title ? title : '提示', {icon:`${__dirname}/bin/img/icon.png`, body: s})
}

var no_sel_show_
function select__(f, only) {
	var path = e_cn__('path')
	if(!only) {
		var i2 = 0
		for(var i = 0; i < path.length; i++) {
			if(path[i].checked)
				i2++
		}
		if(i2 == 0) {
			if(no_sel_show_)
				return
			nn__('无选？')
			no_sel_show_ = true
			setTimeout(function() {
				no_sel_show_ = false
			}, 10000)
		}
	}
	for(var i = 0; i < path.length; i++) {
		if(f(path[i]) == false)
			break
	}
}

function select_all(b) {
	select__(function(path) {
		path.checked = b == null ? !path.checked : b
	}, true)
}

function click__(thiz) {
	select_all(false)
	var e = thiz.parentNode.childNodes[0]
	e.checked = true
	return false
}

var list_clear_ = false, list_add_
function list_add(title, path, pic, i) {
	if(title == '') {
		switch(pic) {
		case 'e':
			if(i == 0) {
				htm__('list', '无')
			}
			break
		}
		return
	}
	setTimeout(function() {
		var item = new__('div')
		item.className = 'item'
		item.id = 'item' + i
		var a = new__('a')
		htm__(item, ''
				+ '<div class=item-2>'
				+ '<input type=checkbox value="' + path + '" class=path title=' + i + '><br>'
				+ '<a href=# onclick="return click__(this)">'
				+ '<div class=item-1>'
				+ '<div class=pic><img src2="' + pic + '" id=pic' + i + '></div>'
				+ '<div class=title><span class="title-1 title-2">' + title + '</span>'
				+ '</div></div></a>'
				+ '</div>')
		if(!list_clear_) {
			htm__('list', '')
			list_clear_ = true
		}
		add__(item, 'list')

		if(i < 100)
			zhugeshow__()
	}, list_add_ * 40)
	list_add_++
}
function list_start(f) {
	list_clear_ = false
	htm__('list', '<img src=bin/img/loading.gif>')
	list_add_ = 1
	if(f)
		f()
}
