(function(){
var g=document,l=navigator,m=window;function aa(){var a=g.cookie,c=Math.round((new Date).getTime()/1000),b=m.google_analytics_domain_name,d=typeof b=="undefined"?ba("auto"):ba(b),e=a.indexOf("__utma="+d+".")>-1,f=a.indexOf("__utmb="+d)>-1,i=a.indexOf("__utmc="+d)>-1,k,j={};if(e){k=a.split("__utma="+d+".")[1].split(";")[0].split(".");j.sid=f&&i?k[3]+"":m&&m.gaGlobal&&m.gaGlobal.sid?m.gaGlobal.sid:c+"";j.vid=k[0]+"."+k[1];j.from_cookie=true;j.dh=d}else{j.sid=m&&m.gaGlobal&&m.gaGlobal.sid?m.gaGlobal.sid:
c+"";j.vid=m&&m.gaGlobal&&m.gaGlobal.vid?m.gaGlobal.vid:(ca()^ha())*2147483647+"."+c;j.from_cookie=false}j.hid=m&&m.gaGlobal&&m.gaGlobal.hid?m.gaGlobal.hid:ca();m.gaGlobal=j;return j}function ca(){return Math.round(Math.random()*2147483647)}function ha(){var a=g.cookie?g.cookie:"",c=m.history.length,b,d,e=[l.appName,l.version,l.language?l.language:l.browserLanguage,l.platform,l.userAgent,l.javaEnabled()?1:0].join("");if(m.screen)e+=m.screen.width+"x"+m.screen.height+m.screen.colorDepth;else if(m.java){d=
java.awt.Toolkit.getDefaultToolkit().getScreenSize();e+=d.screen.width+"x"+d.screen.height}e+=a;e+=g.referrer?g.referrer:"";b=e.length;while(c>0)e+=c--^b++;return ia(e)}function ia(a){var c=1,b=0,d,e;if(!(a==undefined||a=="")){c=0;for(d=a.length-1;d>=0;d--){e=a.charCodeAt(d);c=(c<<6&268435455)+e+(e<<14);b=c&266338304;c=b!=0?c^b>>21:c}}return c}function ba(a){if(!a||a==""||a=="none")return 1;if("auto"==a){a=g.domain;if("www."==a.substring(0,4))a=a.substring(4,a.length)}return ia(a)};var s={google_ad_channel:"channel",google_ad_host:"host",google_ad_host_channel:"h_ch",google_ad_host_tier_id:"ht_id",google_ad_region:"region",google_ad_section:"region",google_ad_type:"ad_type",google_adtest:"adtest",google_alternate_ad_url:"alternate_ad_url",google_alternate_color:"alt_color",google_bid:"bid",google_city:"gcs",google_color_bg:"color_bg",google_color_border:"color_border",google_color_line:"color_line",google_color_link:"color_link",google_color_text:"color_text",google_color_url:"color_url",
google_contents:"contents",google_country:"gl",google_cust_age:"cust_age",google_cust_ch:"cust_ch",google_cust_gender:"cust_gender",google_cust_id:"cust_id",google_cust_interests:"cust_interests",google_cust_job:"cust_job",google_cust_l:"cust_l",google_cust_lh:"cust_lh",google_cust_u_url:"cust_u_url",google_disable_video_autoplay:"disable_video_autoplay",google_ed:"ed",google_encoding:"oe",google_feedback:"feedback_link",google_flash_version:"flash",google_gl:"gl",google_hints:"hints",google_kw:"kw",
google_kw_type:"kw_type",google_language:"hl",google_referrer_url:"ref",google_region:"gr",google_reuse_colors:"reuse_colors",google_safe:"adsafe",google_targeting:"targeting",google_ui_features:"ui",google_video_doc_id:"video_doc_id",google_video_product_type:"video_product_type",google_page_url:"url"},y={google_ad_format:"format",google_ad_output:"output",google_ad_callback:"callback",google_ad_override:"google_ad_override",google_ad_slot:"slotname",google_analytics_uacct:"ga_wpids",google_correlator:"correlator",
google_cpa_choice:"cpa_choice",google_ctr_threshold:"ctr_t",google_image_size:"image_size",google_last_modified_time:"lmt",google_max_num_ads:"num_ads",google_max_radlink_len:"max_radlink_len",google_num_radlinks:"num_radlinks",google_num_radlinks_per_unit:"num_radlinks_per_unit",google_only_ads_with_video:"only_ads_with_video",google_page_location:"loc",google_rl_dest_url:"rl_dest_url",google_rl_filtering:"rl_filtering",google_rl_mode:"rl_mode",google_rt:"rt",google_skip:"skip"};function z(){}z.prototype.n=function(){};z.prototype.o=function(){};z.prototype.m=function(){};var D=null;function E(a){D&&D.n(a)}function H(a){D&&D.o(a)}function ja(a){D&&D.m(a)}function I(){this.b=this.k();this.e=false;if(!this.b){this.e=this.g();this.e||H("Browser does not allow cookies")}}I.prototype.d="__gads=";I.prototype.c="GoogleAdServingTest=";I.prototype.j=function(){return this.b};I.prototype.setCookieInfo=function(a){this.a=a._cookies_[0];if(this.a!=null){this.b=this.a._value_;this.l()}};
I.prototype.i=function(a){var c=(new Date).valueOf(),b=new Date;b.setTime(c+a);return b};I.prototype.h=function(a){if(this.b!=null||!this.e){E("Skipping fetch cookie call");return}var c="script",b=document.domain,d="http://partner.googleadservices.com/gampad/cookie.js?callback=_GA_googleCookieHelper.setCookieInfo&client="+J(a)+"&domain="+J(b);E("Issuing a fetch cookie call with <a href='"+d+"'>"+d+"</a>");document.write("<"+c+' src="'+d+'"></'+c+">")};I.prototype.g=function(){document.cookie=this.c+
"Good";var a=this.f(this.c),c=a=="Good";if(c){var b=this.i(-1);document.cookie=this.c+"; expires="+b.toGMTString()}return c};I.prototype.k=function(){var a=this.f(this.d);a!=null?E("Read first party cookie: "+a):H("No first party cookie found");return a};I.prototype.f=function(a){var c=document.cookie,b=c.indexOf(a),d=null;if(b!=-1){var e=b+a.length,f=c.indexOf(";",e);if(f==-1)f=c.length;d=c.substring(e,f)}return d};I.prototype.l=function(){if(this.a==null)H("Skipping cookie creation: no cookie info");
else if(this.b==null)ja("Skipping cookie creation: no cookie value");else{var a=new Date;a.setTime(1000*this.a._expires_);var c=this.a._domain_,b=this.d+this.b+"; expires="+a.toGMTString()+"; path="+this.a._path_+"; domain=."+c;document.cookie=b;E("Written cookie: "+b)}};function ka(){if(navigator.plugins&&navigator.mimeTypes.length){var a=navigator.plugins["Shockwave Flash"];if(a&&a.description)return a.description.replace(/([a-zA-Z]|\s)+/,"").replace(/(\s)+r/,".")}else if(navigator.userAgent&&navigator.userAgent.indexOf("Windows CE")>=
0){var c=3,b=1;while(b)try{b=new ActiveXObject("ShockwaveFlash.ShockwaveFlash."+(c+1));c++}catch(d){b=null}return c.toString()}else if(la("msie")&&!window.opera){var b=null;try{b=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7")}catch(d){var c=0;try{b=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");c=6;b.AllowScriptAccess="always"}catch(d){if(c==6)return c.toString()}try{b=new ActiveXObject("ShockwaveFlash.ShockwaveFlash")}catch(d){}}if(b!=null){var c=b.GetVariable("$version").split(" ")[1];
return c.replace(/,/g,".")}}return"0"};window.IDICommon=window.IDICommon||(function(){return{getHash:function(a){var c=a.indexOf("#")+1;return c?a.substr(c):""},htmlEscape:function(a){return/[&<>\"]/.test(a)?a.replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/\"/g,"&quot;"):a},makeIframeTag:function(a){var c="<iframe";for(var b in a)c+=" "+b+'="'+IDICommon.htmlEscape(a[b])+'"';return c+"></iframe>"},getIframe:function(a,c){try{return a.frames[c]}catch(b){return null}},makeIframeNode:function(a){var c=document.createElement("iframe");
for(var b in a)c.setAttribute(b,a[b]);return c},appendHiddenIframe:function(a,c){setTimeout(function(){document.body.appendChild(IDICommon.makeIframeNode({id:a,name:a,src:c,width:0,height:0,frameBorder:0}))},0)},writeHiddenIframe:function(a,c){document.write(IDICommon.makeIframeTag({id:a,name:a,src:c,width:0,height:0,frameBorder:0}))},splitURIComponent:function(a,c){var b=[],d=a.length,e=0;while(e<d){var f=a.substr(e,c),i=f.length;if(e+i<d)for(var k=1;k<3;++k)if(f.charAt(i-k)=="%")f=f.substr(0,i-=
k);b.push(f);e+=i}return b},MAX_URL_LENGTH:4095,IDI_DEFAULT_POLLING_INTERVAL:1000}})();window.IDIHost=window.IDIHost||(function(){var a=window.location.href.replace(/([^:\/])\/.*$/,"$1/robots.txt"),c="",b={},d={},e={},f={},i={};function k(h,n){for(var t in n)h[t]=n[t]}function j(h,n){var t=window.frames[h];if(t){var w;while(w=IDICommon.getIframe(t,h+"_"+b[h])){try{if(w.location.href=="about:blank")break}catch(u){break}e[h]+=IDICommon.getHash(w.location.href);++b[h]}var v=e[h].split("$"),B=v.length-1;if(B>0){e[h]=v[B];for(var C=0;C<B;++C)n(decodeURIComponent(v[C]),h)}}}function q(h){return c||
h.replace(/([^:\/]\/).*$/,"$1ig/idi_relay")}function o(h){window.clearInterval(i[h]);i[h]=0}function r(h){a=h}function p(h){c=h}function x(h,n,t){o(h);i[h]=window.setInterval(function(){j(h,n)},typeof t=="object"&&t.pollingInterval||IDICommon.IDI_DEFAULT_POLLING_INTERVAL)}function Q(h,n,t){var w;if(typeof t=="object")w=t.moduleRelayUrl;var u=d[h];if(isNaN(u))throw new Error("Invalid module id");else{var v=typeof w=="string"?w:q(f[h]),B=encodeURIComponent(n)+"$",C=IDICommon.MAX_URL_LENGTH-1-v.length,
F=IDICommon.splitURIComponent(B,C),R=F.length;for(var A=0;A<R;++A)IDICommon.appendHiddenIframe(h+"_"+(u+A),v+"#"+F[A]);d[h]+=R}}function S(h,n,t,w,u){var v={frameBorder:0,scrolling:"no"},B,C,F,R,A;if(typeof u=="object"){B=u.iframeAttrs;C=u.callback;F=u.userPrefs;R=u.pollingInterval;A=u.parentDivId}typeof B=="object"&&k(v,B);k(v,{id:n,name:n,src:h,width:t,height:w});b[n]=0;d[n]=0;e[n]="";f[n]=h;var T=[];if(typeof F=="object")for(var G in F)T.push(encodeURIComponent(G)+"="+encodeURIComponent(F[G]));
if(typeof C=="function"){T.push("idi_hr="+encodeURIComponent(a));window.IDIHost.registerListener(n,C,u)}if(T.length){var K=T.join("&");if(v.src.length+1+K.length>IDICommon.MAX_URL_LENGTH){K+="$";var da=q(h),ta=IDICommon.MAX_URL_LENGTH-1-da.length,ea=IDICommon.splitURIComponent(K,ta),fa=ea.length;for(var G=0;G<fa;++G){var X=n+"_"+G,ga=da+"#"+ea[G];if(A){var Y=document.getElementById(A);Y.innerHTML+=IDICommon.makeIframeTag({id:X,name:X,src:ga,width:0,height:0,frameBorder:0})}else IDICommon.writeHiddenIframe(X,
ga)}d[n]+=fa;K=""}v.src+="#"+K}if(A){var Y=document.getElementById(A);Y.innerHTML+=IDICommon.makeIframeTag(v)}else document.write(IDICommon.makeIframeTag(v))}return{setHostRelayUrl:r,setModuleRelayUrl:p,getModuleRelayUrl:q,registerListener:x,unregisterListener:o,postMessageToModule:Q,createModule:S}})();var ma=ma||{},L=this;var na=function(a,c){var b=c.length;for(var d=0;d<b;d++){var e=b==1?c:c.charAt(d);if(a.charAt(0)==e&&a.charAt(a.length-1)==e)return a.substring(1,a.length-1)}return a};var oa,pa,qa,ra,sa,ua,va,wa,xa,ya,za,Aa=function(){var a=false,c=false,b=false,d=false,e=false,f=false,i=false,k=false,j=false,q="";if(L.navigator){var o=L.navigator,r=o.userAgent;a=r.indexOf("Opera")==0;c=!a&&r.indexOf("MSIE")!=-1;b=!a&&r.indexOf("WebKit")!=-1;j=b&&r.indexOf("Mobile")!=-1;d=!a&&!b&&o.product=="Gecko";e=d&&o.vendor=="Camino";var p,x;if(a)p=L.opera.version();else{if(d)x=/rv\:([^\);]+)(\)|;)/;else if(c)x=/MSIE\s+([^\);]+)(\)|;)/;else if(b)x=/WebKit\/(\S+)/;if(x){x.test(r);p=RegExp.$1}}q=
o.platform||"";f=q.indexOf("Mac")!=-1;i=q.indexOf("Win")!=-1;k=q.indexOf("Linux")!=-1}oa=a;pa=c;qa=d;ra=e;sa=b;ua=j;va=p;wa=q;xa=f;ya=i;za=k};Aa();var Ba=oa;var Ca=function(a){return typeof a=="string"?document.getElementById(a):a},Da=Ca;var Ea=function(a){return a.nodeType==9?a:a.ownerDocument||a.document};var Fa=function(a,c){var b=Ea(a);if(b.defaultView&&b.defaultView.getComputedStyle){var d=b.defaultView.getComputedStyle(a,"");if(d)return d[c]}return null};var Ga=function(a){var c=Ea(a),b="";if(c.createTextRange){var d=c.body.createTextRange();d.moveToElementText(a);b=d.queryCommandValue("FontName")}if(!b){b=Fa(a,"fontFamily")||(a.currentStyle?a.currentStyle.fontFamily:null)||a.style.fontFamily;if(Ba&&za)b=b.replace(/ \[[^\]]*\]/,"")}var e=b.split(",");if(e.length>1)b=e[0];return na(b,"\"'")};function M(a){return a!=null?'"'+a+'"':'""'}function J(a){return typeof encodeURIComponent=="function"?encodeURIComponent(a):escape(a)}function N(a,c){if(a&&c)window.google_ad_url+="&"+a+"="+c}function O(a){var c=window,b=s[a]||y[a]||null,d=c[a];N(b,d)}function P(a,c){c&&N(a,J(c))}function U(a){var c=window,b=s[a]||y[a]||null,d=c[a];P(b,d)}function V(a,c){var b=window,d=s[a]||y[a]||null,e=b[a];if(d&&e&&typeof e=="object")e=e[c%e.length];N(d,e)}function Ha(a,c){var b=a.screen,d=navigator.javaEnabled(),
e=-c.getTimezoneOffset();if(b){N("u_h",b.height);N("u_w",b.width);N("u_ah",b.availHeight);N("u_aw",b.availWidth);N("u_cd",b.colorDepth)}N("u_tz",e);N("u_his",history.length);N("u_java",d);navigator.plugins&&N("u_nplug",navigator.plugins.length);navigator.mimeTypes&&N("u_nmime",navigator.mimeTypes.length)}function Ia(a){if(!a.google_enable_first_party_cookie)return;if(D==null)D=new z;if(a._GA_googleCookieHelper==null)a._GA_googleCookieHelper=new I;if(!a._google_cookie_fetched){a._google_cookie_fetched=
true;a._GA_googleCookieHelper.h(W(a.google_ad_client))}}function W(a){if(a){a=a.toLowerCase();if(a.substring(0,3)!="ca-")a="ca-"+a}return a}function Ja(a){if(a){a=a.toLowerCase();if(a.substring(0,9)!="dist-aff-")a="dist-aff-"+a}return a}function Ka(a,c){var b=document.getElementById(a);b.style.height=c+"px"}function La(a,c,b){window.clearTimeout(b);var d=/^google_resize_flash_ad_idi\((\d+)\)/,e=a.match(d);e&&Ka(c,e[1])}function Ma(a,c,b,d){b=b.substring(0,2000);b=b.replace(/%\w?$/,"");var e="script";
if((a.google_ad_output=="js"||a.google_ad_output=="json_html")&&(a.google_ad_request_done||a.google_radlink_request_done))c.write("<"+e+' language="JavaScript1.1" src='+M(b)+"></"+e+">");else if(a.google_ad_output=="html"){if(a.name!="google_ads_frame"){d!=null&&c.write('<div id="'+d+'">');if(Na(a.google_ad_output,a.google_ad_client)){IDIHost.setModuleRelayUrl("http://pagead2.googlesyndication.com/pagead/idi_relay.html");var f=0;if(a.google_num_0ad_slots)f+=a.google_num_0ad_slots;if(a.google_num_ad_slots)f+=
a.google_num_ad_slots;if(a.google_num_sdo_slots)f+=a.google_num_sdo_slots;var i="google_inline_div"+f,k="<div id="+M(i)+' style="position:relative;width:'+a.google_ad_width+'px"></div><div style="position:relative;width:'+a.google_ad_width+"px;height:"+a.google_ad_height+'px;z-index:-1"></div>';c.write(k);var j="google_frame"+f,q=a.setTimeout(function(){IDIHost.unregisterListener(j)},5000);IDIHost.createModule(b,j,a.google_ad_width,a.google_ad_height,{callback:function(o,r){La(o,r,q)},pollingInterval:500,
iframeAttrs:{style:"position: absolute;left:0px",marginWidth:"0",marginHeight:"0",vspace:"0",hspace:"0",allowTransparency:"true"},parentDivId:i})}else{c.write('<iframe name="google_ads_frame" width='+M(a.google_ad_width)+" height="+M(a.google_ad_height)+" frameborder="+M(a.google_ad_frameborder)+" src="+M(b)+' marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no">');c.write("</iframe>")}d!=null&&c.write("</div>")}}else a.google_ad_output=="textlink"&&c.write("<"+
e+' language="JavaScript1.1" src='+M(b)+"></"+e+">")}function Oa(a){for(var c in s)a[c]=null;for(var c in y){if(c=="google_correlator")continue;a[c]=null}}function Pa(a){if(a.google_ad_format)return a.google_ad_format.indexOf("_0ads")>0;return a.google_ad_output!="html"&&a.google_num_radlinks>0}function Z(a){return a&&a.indexOf("_sdo")!=-1}function Qa(a){var c=null,b=window,d=document,e=new Date,f=e.getTime(),i=b.google_ad_format,k="http://pagead2.googlesyndication.com";if(b.google_cpa_choice!=c){b.google_ad_url=
k+"/cpa/ads?";b.google_ad_url+="client="+escape(W(b.google_ad_client));b.google_ad_region="_google_cpa_region_";O("google_cpa_choice");if(typeof d.characterSet!="undefined")P("oe",d.characterSet);else typeof d.charset!="undefined"&&P("oe",d.charset)}else if(Z(i)){b.google_ad_url=k+"/pagead/sdo?";b.google_ad_url+="client="+escape(Ja(b.google_ad_client))}else{b.google_ad_url=k+"/pagead/ads?";b.google_ad_url+="client="+escape(W(b.google_ad_client))}O("google_ad_host");O("google_ad_host_tier_id");var j=
b.google_num_slots_by_client,q=b.google_num_slots_by_channel,o=b.google_prev_ad_formats_by_region,r=b.google_prev_ad_slotnames_by_region;if(b.google_ad_region==c&&b.google_ad_section!=c)b.google_ad_region=b.google_ad_section;var p=b.google_ad_region==c?"":b.google_ad_region;if(Z(i)){b.google_num_sdo_slots=b.google_num_sdo_slots?b.google_num_sdo_slots+1:1;if(b.google_num_sdo_slots>4)return false}else if(Pa(b)){b.google_num_0ad_slots=b.google_num_0ad_slots?b.google_num_0ad_slots+1:1;if(b.google_num_0ad_slots>
3)return false}else if(b.google_cpa_choice==c){b.google_num_ad_slots=b.google_num_ad_slots?b.google_num_ad_slots+1:1;if(b.google_num_slots_to_rotate){o[p]=c;r[p]=c;if(b.google_num_slot_to_show==c)b.google_num_slot_to_show=f%b.google_num_slots_to_rotate+1;if(b.google_num_slot_to_show!=b.google_num_ad_slots)return false}else if(b.google_num_ad_slots>6&&p=="")return false}N("dt",e.getTime());O("google_language");b.google_country?O("google_country"):O("google_gl");O("google_region");U("google_city");
U("google_hints");O("google_safe");O("google_encoding");O("google_last_modified_time");U("google_alternate_ad_url");O("google_alternate_color");O("google_skip");O("google_targeting");var x=b.google_ad_client;if(j[x])j[x]+=1;else{j[x]=1;j.length+=1}if(o[p])if(!Z(i)){P("prev_fmts",o[p].toLowerCase());j.length>1&&N("slot",j[x])}r[p]&&P("prev_slotnames",r[p].toLowerCase());if(i&&!b.google_ad_slot){P("format",i.toLowerCase());Z(i)||(o[p]=o[p]?o[p]+","+i:i)}if(b.google_ad_slot)r[p]=r[p]?r[p]+","+b.google_ad_slot:
b.google_ad_slot;O("google_max_num_ads");N("output",b.google_ad_output);O("google_adtest");O("google_ad_callback");O("google_ad_slot");U("google_correlator");if(b.google_ad_channel){U("google_ad_channel");var Q="",S=b.google_ad_channel.split(/[+, ]/);for(var h=0;h<S.length;h++){var n=S[h];if(q[n])Q+=n+"+";else q[n]=1}P("pv_ch",Q)}if(b.google_ad_host_channel){U("google_ad_host_channel");var t=Ra(b.google_ad_host_channel,b.google_viewed_host_channels);P("pv_h_ch",t)}b.google_enable_first_party_cookie&&
P("cookie",b._GA_googleCookieHelper.j());U("google_page_url");V("google_color_bg",f);V("google_color_text",f);V("google_color_link",f);V("google_color_url",f);V("google_color_border",f);V("google_color_line",f);b.google_reuse_colors?N("reuse_colors",1):N("reuse_colors",0);O("google_kw_type");U("google_kw");U("google_contents");O("google_num_radlinks");O("google_max_radlink_len");O("google_rl_filtering");O("google_rl_mode");O("google_rt");U("google_rl_dest_url");O("google_num_radlinks_per_unit");O("google_ad_type");
O("google_image_size");O("google_ad_region");O("google_feedback");U("google_referrer_url");U("google_page_location");N("frm",b.google_iframing);O("google_bid");O("google_ctr_threshold");O("google_cust_age");O("google_cust_gender");O("google_cust_interests");O("google_cust_id");O("google_cust_job");O("google_cust_u_url");O("google_cust_l");O("google_cust_lh");O("google_cust_ch");O("google_ed");O("google_video_doc_id");O("google_video_product_type");U("google_ui_features");U("google_only_ads_with_video");
U("google_disable_video_autoplay");a&&P("ff",Ga(a));if(b.top.location==d.location&&d.body){var w=d.body.scrollHeight,u=d.body.clientHeight;u&&w&&P("cc",Math.round(u*100/w))}aa();N("ga_vid",b.gaGlobal.vid);N("ga_sid",b.gaGlobal.sid);N("ga_hid",b.gaGlobal.hid);N("ga_fc",b.gaGlobal.from_cookie);U("google_analytics_uacct");O("google_ad_override");O("google_flash_version");Ha(b,e);return true}function Ra(a,c){var b=a.split("|"),d=-1,e=[];for(var f=0;f<b.length;f++){var i=b[f].split(/[+, ]/);c[f]||(c[f]=
{});var k="";for(var j=0;j<i.length;j++){var q=i[j];if(c[f][q])k+="+"+q;else c[f][q]=1}k=k.slice(1);e[f]=k;if(k!="")d=f}var o="";if(d>-1){for(var f=0;f<d;f++)o+=e[f]+"|";o+=e[d]}return o}function Sa(){var a=window,c=document;Ia(a);var b;if(Math.random()<0.01){var d="google_temp_span";if(!Da(d)){c.write("<span id="+d+"></span>");b=Da(d)}}var e=Qa(b);b&&(b&&b.parentNode?b.parentNode.removeChild(b):null);if(!e)return;Ma(a,c,a.google_ad_url,null);Oa(a)}function Ta(){Sa();return true}function Ua(a,c){var b=
c.documentElement;if(a.top.location==c.location)return false;if(a.google_ad_width&&a.google_ad_height){var d=1,e=1;if(a.innerHeight){d=a.innerWidth;e=a.innerHeight}else if(b&&b.clientHeight){d=b.clientWidth;e=b.clientHeight}else if(c.body){d=c.body.clientWidth;e=c.body.clientHeight}if(e>2*a.google_ad_height||d>2*a.google_ad_width)return false}return true}function Va(a){var c=window,b=null,d=c.onerror;c.onerror=a;if(c.google_ad_frameborder==b)c.google_ad_frameborder=0;if(c.google_ad_output==b)c.google_ad_output=
"html";if(Z(c.google_ad_format)){var e=c.google_ad_format.match(/^(\d+)x(\d+)_.*/);if(e){c.google_ad_width=parseInt(e[1],10);c.google_ad_height=parseInt(e[2],10);c.google_ad_output="html"}}if(c.google_ad_format==b&&c.google_ad_output=="html")c.google_ad_format=c.google_ad_width+"x"+c.google_ad_height;Wa(c,document);if(c.google_num_slots_by_channel==b)c.google_num_slots_by_channel=[];if(c.google_viewed_host_channels==b)c.google_viewed_host_channels=[];if(c.google_num_slots_by_client==b)c.google_num_slots_by_client=
[];if(c.google_prev_ad_formats_by_region==b)c.google_prev_ad_formats_by_region=[];if(c.google_prev_ad_slotnames_by_region==b)c.google_prev_ad_slotnames_by_region=[];if(c.google_correlator==b)c.google_correlator=(new Date).getTime();if(c.google_adslot_loaded==b)c.google_adslot_loaded={};if(c.google_adContentsBySlot==b)c.google_adContentsBySlot={};if(c.google_flash_version==b)c.google_flash_version=ka();c.google_blocking_test==b&&Xa(c);c.onerror=d}function Xa(a){a.google_blocking_test=1;if(Math.random()<
0.0010){var c="script",b=(new Date).getTime(),d=new Array("<",c,' type="text/javascript">',"var i=new Image();",'i.src="http://googleads.g.doubleclick.net/',"pagead/gen_204?id=js_blocking&t=d&dt=",b,'";',"var j=new Image();",'j.src="http://pagead2.googlesyndication.com/',"pagead/gen_204?id=js_blocking&t=p&dt=",b,'";',"</",c,">");document.write(d.join(""))}}function la(a){if(a in $)return $[a];return $[a]=navigator.userAgent.toLowerCase().indexOf(a)!=-1}var $={};function Na(a,c){if(a!="html")return false;
var b={};b["ca-pub-7027491298716603"]=true;b["ca-pub-8344185808443527"]=true;b["ca-google"]=true;return b[W(c)]!=null}function Ya(a){var c={},b=a.split("?"),d=b[b.length-1].split("&");for(var e=0;e<d.length;e++){var f=d[e].split("=");if(f[0])try{c[f[0].toLowerCase()]=f.length>1?window.decodeURIComponent?decodeURIComponent(f[1].replace(/\+/g," ")):unescape(f[1]):""}catch(i){}}return c}function Za(){var a=window,c=Ya(document.URL);if(c.google_ad_override){a.google_ad_override=c.google_ad_override;a.google_adtest=
"on"}}function $a(a,c){for(var b in c)a["google_"+b]=c[b]}function ab(a,c){if(!c)return a.location;return a.referrer}function bb(a,c){if(!c&&a.google_referrer_url==null)return"0";else if(c&&a.google_referrer_url==null)return"1";else if(!c&&a.google_referrer_url!=null)return"2";else if(c&&a.google_referrer_url!=null)return"3";return"4"}function cb(a,c,b,d){a.page_url=ab(b,d);a.page_location=null}function db(a,c,b,d){a.page_url=c.google_page_url;a.page_location=ab(b,d)||"EMPTY"}function eb(a,c){var b=
{},d=Ua(a,c);b.iframing=bb(a,d);!!a.google_page_url?db(b,a,c,d):cb(b,a,c,d);b.last_modified_time=c.location==b.page_url?Date.parse(c.lastModified)/1000:null;b.referrer_url=d?a.google_referrer_url:a.google_page_url&&a.google_referrer_url?a.google_referrer_url:c.referrer;return b}function fb(a){var c={},b=a.URL.substring(a.URL.lastIndexOf("http"));c.iframing=null;c.page_url=b;c.page_location=a.location;c.last_modified_time=null;c.referrer_url=b;return c}function Wa(a,c){var b;b=a.google_page_url==null&&
gb[c.domain]?fb(c):eb(a,c);$a(a,b)}var gb={};gb["ad.yieldmanager.com"]=true;Za();Va(Ta);Sa();
})()
