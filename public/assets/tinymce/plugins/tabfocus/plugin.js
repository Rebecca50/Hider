tinymce.PluginManager.add("tabfocus",function(e){function t(e){9!==e.keyCode||e.ctrlKey||e.altKey||e.metaKey||e.preventDefault()}function n(t){function n(n){function a(e){return"BODY"===e.nodeName||"hidden"!=e.type&&"none"!=e.style.display&&"hidden"!=e.style.visibility&&a(e.parentNode)}function c(e){return/INPUT|TEXTAREA|BUTTON/.test(e.tagName)&&tinymce.get(t.id)&&-1!=e.tabIndex&&a(e)}if(u=i.select(":input:enabled,*[tabindex]:not(iframe)"),o(u,function(t,n){return t.id==e.id?(r=n,!1):void 0}),n>0){for(d=r+1;d<u.length;d++)if(c(u[d]))return u[d]}else for(d=r-1;d>=0;d--)if(c(u[d]))return u[d];return null}var r,u,c,d;if(!(9!==t.keyCode||t.ctrlKey||t.altKey||t.metaKey||t.isDefaultPrevented())&&(c=a(e.getParam("tab_focus",e.getParam("tabfocus_elements",":prev,:next"))),1==c.length&&(c[1]=c[0],c[0]=":prev"),u=t.shiftKey?":prev"==c[0]?n(-1):i.get(c[0]):":next"==c[1]?n(1):i.get(c[1]))){var y=tinymce.get(u.id||u.name);u.id&&y?y.focus():window.setTimeout(function(){tinymce.Env.webkit||window.focus(),u.focus()},10),t.preventDefault()}}var i=tinymce.DOM,o=tinymce.each,a=tinymce.explode;e.on("init",function(){e.inline&&tinymce.DOM.setAttrib(e.getBody(),"tabIndex",null),e.on("keyup",t),tinymce.Env.gecko?e.on("keypress keydown",n):e.on("keydown",n)})});