!function(){function e(){}function n(e){var n="";if(n+=t(),n+=B,n+=J,n+=G,n+="/",n+=H,n+="?event="+e[1],n+="&time="+L,n+="&__v="+Math.floor(1e5*Math.random()),c(e[2])){e[2]=p(e[2]);var r=s(e[2]);r&&(n+="&"+r)}return n}function t(){return v&&v.location&&"https:"===v.location.protocol?"https:":"http:"}function r(){for(var e=0,n=K.length;n>e;e++)if(K[e][0]===O){G=K[e][1],H=K[e][2],K[e][3]&&(B=K[e][3]),K.splice(e,1),i();break}}function o(t){t=f(t);var r=n(t),o=g(r);b instanceof e&&console.log(o)}function i(){if(G&&H){var e=K.length;if(e)for(var n=0;e>n;n++)a(K[n]);K=[]}else r()}function a(e){u(e)&&_(e[0])&&(e[0]===D?S[e[1]]&&(J=e[1]):m(e[1])&&e[0]===j&&o(e))}function f(e){var n=e[2]||{};return v&&v.location&&(n.url=v.location.toString()),b.referrer&&(n.referrer=b.referrer),b.cookie&&(n.cookie=b.cookie),"undefined"!=typeof navigator&&(n.user_agent=navigator.userAgent),e[2]=n,e}function u(e){return"object"==typeof e&&Object.prototype.hasOwnProperty.call(e,"length")}function c(e){return null!==e&&"object"==typeof e}function d(e){return"number"==typeof e&&13===e.toString().length}function l(e,n){if("string"==typeof e){if("undefined"!=typeof Array.prototype.indexOf)return-1!==n.indexOf(e);for(var t=0;t<n.length;t++)if(n[t]===e)return!0}return!1}function p(e){var n={};if(c(e)){for(var t in e)F.hasOwnProperty(t)&&(e[F[t]]=e[t],delete e[t]);n=e}return n}function g(e){var n=b.createElement("img");return n.width=1,n.height=1,n.src=e,n.onload=null,n.onerror=null,n}function s(e){var n=[];for(var t in e)e.hasOwnProperty(t)&&n.push(encodeURIComponent(t)+"="+encodeURIComponent(e[t]));return n.join("&")}function _(e){return e!==O?l(e,U):!1}function m(e){return l(e,z)}e.prototype.createElement=function(e){return{element:e}};var y="_dct",v="undefined"!=typeof window?window:global,b="undefined"!=typeof document?document:new e,h=v.DataCloudObject||y,w=v[h]||{},O="create",j="send",D="route",C="confirmation",k="landing",x="login",P="pageview",q="registration",A="successful_payment",E="info",I="/",M="/sync/",R="/sync_forward/",S=[I,M,R],U=[O,j,D],z=[C,k,x,P,q,A,E],B="//t.insigit.com",F={aif_id:"afd",sub_aif_id:"sa",traffic_source:"ts",aff_campaign:"ac",platform:"p",profile_id:"pid",site_id:"sid",gender1:"g1",gender2:"g2",gender3:"g3",gender0:"g0",date_of_birth:"dfb",age_period:"ap",age:"ag",age0:"ag0",domain:"d",amount:"am",currency:"cr",visitor_id:"vid",partner_id:"ext",partner_subid:"eid",email:"emh",email_domain:"emd",confirmed_date:"cd","registration _date":"rd",browser_name_registration:"bnr",browser_language_registration:"blr",devicetype_registration:"dtr",login_ip:"lip",reg_ip:"rip",country_reg:"c",order_date:"od",transaction_status:"ts",ip_payment:"ipp",browser_name_payment:"bnp",browser_language_payment:"blp",number_of_logins:"l"},G=null,H=null,J=I,K=[];u(w.q)&&(K=w.q);var L="function"==typeof Date.now?Date.now():+new Date;d(w.l)&&(L=w.l);var N=function(){K.push(arguments),i()};N.prototype={},v&&v.DataCloudObject?(v[v.DataCloudObject]=N,i()):v&&(v[y]=N,i())}();