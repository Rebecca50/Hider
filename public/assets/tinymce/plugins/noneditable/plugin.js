tinymce.PluginManager.add("noneditable",function(e){function t(e){var t;if(1===e.nodeType){if(t=e.getAttribute(u),t&&"inherit"!==t)return t;if(t=e.contentEditable,"inherit"!==t)return t}return null}function n(e){for(var n;e;){if(n=t(e))return"false"===n?e:null;e=e.parentNode}}function r(){function r(e){for(;e;){if(e.id===g)return e;e=e.parentNode}}function a(e){var t;if(e)for(t=new f(e,e),e=t.current();e;e=t.next())if(3===e.nodeType)return e}function i(n,r){var a,i;return"false"===t(n)&&u.isBlock(n)?void s.select(n):(i=u.createRng(),"true"===t(n)&&(n.firstChild||n.appendChild(e.getDoc().createTextNode("\xa0")),n=n.firstChild,r=!0),a=u.create("span",{id:g,"data-mce-bogus":!0},m),r?n.parentNode.insertBefore(a,n):u.insertAfter(a,n),i.setStart(a.firstChild,1),i.collapse(!0),s.setRng(i),a)}function o(e){var t,n,i,o;if(e)t=s.getRng(!0),t.setStartBefore(e),t.setEndBefore(e),n=a(e),n&&n.nodeValue.charAt(0)==m&&(n=n.deleteData(0,1)),u.remove(e,!0),s.setRng(t);else for(i=r(s.getStart());(e=u.get(g))&&e!==o;)i!==e&&(n=a(e),n&&n.nodeValue.charAt(0)==m&&(n=n.deleteData(0,1)),u.remove(e,!0)),o=e}function l(){function e(e,n){var r,a,i,o,l;if(r=d.startContainer,a=d.startOffset,3==r.nodeType){if(l=r.nodeValue.length,a>0&&l>a||(n?a==l:0===a))return}else{if(!(a<r.childNodes.length))return n?null:e;var u=!n&&a>0?a-1:a;r=r.childNodes[u],r.hasChildNodes()&&(r=r.firstChild)}for(i=new f(r,e);o=i[n?"prev":"next"]();){if(3===o.nodeType&&o.nodeValue.length>0)return;if("true"===t(o))return o}return e}var r,a,l,d,u;o(),l=s.isCollapsed(),r=n(s.getStart()),a=n(s.getEnd()),(r||a)&&(d=s.getRng(!0),l?(r=r||a,(u=e(r,!0))?i(u,!0):(u=e(r,!1))?i(u,!1):s.select(r)):(d=s.getRng(!0),r&&d.setStartBefore(r),a&&d.setEndAfter(a),s.setRng(d)))}function d(a){function i(e,t){for(;e=e[t?"previousSibling":"nextSibling"];)if(3!==e.nodeType||e.nodeValue.length>0)return e}function d(e,t){s.select(e),s.collapse(t)}function g(a){function i(e){for(var t=d;t;){if(t===e)return;t=t.parentNode}u.remove(e),l()}function o(){var r,o,l=e.schema.getNonEmptyElements();for(o=new tinymce.dom.TreeWalker(d,e.getBody());(r=a?o.prev():o.next())&&!l[r.nodeName.toLowerCase()]&&!(3===r.nodeType&&tinymce.trim(r.nodeValue).length>0);)if("false"===t(r))return i(r),!0;return n(r)?!0:!1}var f,d,c,g;if(s.isCollapsed()){if(f=s.getRng(!0),d=f.startContainer,c=f.startOffset,d=r(d)||d,g=n(d))return i(g),!1;if(3==d.nodeType&&(a?c>0:c<d.nodeValue.length))return!0;if(1==d.nodeType&&(d=d.childNodes[c]||d),o())return!1}return!0}var m,p,v,E,h=a.keyCode;if(v=s.getStart(),E=s.getEnd(),m=n(v)||n(E),m&&(112>h||h>124)&&h!=c.DELETE&&h!=c.BACKSPACE){if((tinymce.isMac?a.metaKey:a.ctrlKey)&&(67==h||88==h||86==h))return;if(a.preventDefault(),h==c.LEFT||h==c.RIGHT){var y=h==c.LEFT;if(e.dom.isBlock(m)){var T=y?m.previousSibling:m.nextSibling,C=new f(T,T),b=y?C.prev():C.next();d(b,!y)}else d(m,y)}}else if(h==c.LEFT||h==c.RIGHT||h==c.BACKSPACE||h==c.DELETE){if(p=r(v)){if(h==c.LEFT||h==c.BACKSPACE)if(m=i(p,!0),m&&"false"===t(m)){if(a.preventDefault(),h!=c.LEFT)return void u.remove(m);d(m,!0)}else o(p);if(h==c.RIGHT||h==c.DELETE)if(m=i(p),m&&"false"===t(m)){if(a.preventDefault(),h!=c.RIGHT)return void u.remove(m);d(m,!1)}else o(p)}if((h==c.BACKSPACE||h==c.DELETE)&&!g(h==c.BACKSPACE))return a.preventDefault(),!1}}var u=e.dom,s=e.selection,g="mce_noneditablecaret",m="\ufeff";e.on("mousedown",function(n){var r=e.selection.getNode();"false"===t(r)&&r==n.target&&l()}),e.on("mouseup keyup",l),e.on("keydown",d)}function a(t){var n=l.length,r=t.content,a=tinymce.trim(o);if("raw"!=t.format){for(;n--;)r=r.replace(l[n],function(t){var n=arguments,i=n[n.length-2];return i>0&&'"'==r.charAt(i-1)?t:'<span class="'+a+'" data-mce-content="'+e.dom.encode(n[0])+'">'+e.dom.encode("string"==typeof n[1]?n[1]:n[0])+"</span>"});t.content=r}}var i,o,l,f=tinymce.dom.TreeWalker,d="contenteditable",u="data-mce-"+d,c=tinymce.util.VK;i=" "+tinymce.trim(e.getParam("noneditable_editable_class","mceEditable"))+" ",o=" "+tinymce.trim(e.getParam("noneditable_noneditable_class","mceNonEditable"))+" ",l=e.getParam("noneditable_regexp"),l&&!l.length&&(l=[l]),e.on("PreInit",function(){r(),l&&e.on("BeforeSetContent",a),e.parser.addAttributeFilter("class",function(e){for(var t,n,r=e.length;r--;)n=e[r],t=" "+n.attr("class")+" ",-1!==t.indexOf(i)?n.attr(u,"true"):-1!==t.indexOf(o)&&n.attr(u,"false")}),e.serializer.addAttributeFilter(u,function(e){for(var t,n=e.length;n--;)t=e[n],l&&t.attr("data-mce-content")?(t.name="#text",t.type=3,t.raw=!0,t.value=t.attr("data-mce-content")):(t.attr(d,null),t.attr(u,null))}),e.parser.addAttributeFilter(d,function(e){for(var t,n=e.length;n--;)t=e[n],t.attr(u,t.attr(d)),t.attr(d,null)})}),e.on("drop",function(e){n(e.target)&&e.preventDefault()})});