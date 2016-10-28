const z$ = require('bindings')('zhscript')
z$('.', __dirname + '/bin/zhscript/')
z$('加载def.zs')
z$('加载def2.zs')

z$(		[], '加载list.zs',
		[], '加载list2.zs、‘参数栈’', console.log)
z$('加载player.zs、‘参数栈’', console.log)
