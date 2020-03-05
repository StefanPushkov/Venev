Begun.Autocontext.Customization.setTpls({
	"begun_html_tpls": [
		{"block_horizontal": '\
<div class="begun_adv_common_horizontal banners_count_{{banners_count}}">\
<div class="begun_adv_container {{css_mobile_class}}"{{block_hover}}>\
<div class="begun_adv_new_layout begun_adv_container_inner {{css_thumbnails}}">\
{{banners}}\
</div>\
</div>\
<div class="begun_adv_info-block">\
<span class="begun_adv_age">\
18+\
</span>\
</div>\
<a class="begun_adv_sys_logo_new" href="{{begun_url}}" target="_blank" style="display:{{logo_display}}">\
{{begun_new_logo}}\
</a>\
</div>\
'},
        {"block_horizontal_price_domain": '\
<div class="begun_adv_common_horizontal begun_adv_price_domain banners_count_{{banners_count}}">\
<div class="begun_adv_container {{css_mobile_class}}"{{block_hover}}>\
<div class="begun_adv_new_layout begun_adv_container_inner {{css_thumbnails}}">\
{{banners}}\
</div>\
</div>\
<div class="begun_adv_info-block">\
<span class="begun_adv_age">\
</span>\
</div>\
<a class="begun_adv_sys_logo_new" href="{{price_url}}" target="_blank" style="display:{{logo_display}}">\
{{price_new_logo}}\
</a>\
</div>\
'},
		{'banner_horizontal': '\
<div class="begun_adv_cell" title="{{fullDomain}}" onclick="{{onclick}}" _url="{{url}}" _banner_id="{{banner_id}}">\
<div class="begun_adv_block">\
{{thumb}}\
<div class="begun_adv_row">\
<div class="begun_adv_title"><a class="snap_noshots" target="_blank" href="{{url}}" title="{{fullDomain}}" {{styleTitle}}>{{favicon}}<span>{{title}}</span></a></div>\
<div class="begun_adv_text"><a class="snap_noshots" target="_blank" href="{{url}}" title="{{fullDomain}}"{{styleText}}>{{descr}}</a></div>\
{{bnnr_warn}}\
</div>\
<div class="begun_adv_contact"{{styleContact}}><span class="begun_adv_contact_inner">{{contact}}</span><i class="begun_adv_vertical-line"><i></i></i></div>\
</div>\
<i class="begun-adv_border-bottom"></i>\
</div>\
'},
		{'banner_horizontal_rich': '\
<div class="begun_adv_cell begun_adv_rich" title="{{fullDomain}}" onclick="{{onclick}}" _url="{{url}}" _banner_id="{{banner_id}}">\
<div class="begun_adv_block">\
{{picture}}\
<div class="begun_adv_row">\
<div class="begun_adv_title"><a class="snap_noshots" target="_blank" href="{{url}}" title="{{fullDomain}}" {{styleTitle}}>{{favicon}}<span>{{title}}</span></a></div>\
<div class="begun_adv_text"><a class="snap_noshots" target="_blank" href="{{url}}" title="{{fullDomain}}"{{styleText}}>{{descr}}</a></div>\
{{bnnr_warn}}\
</div>\
<div class="begun_adv_contact"{{styleContact}}><span class="begun_adv_contact_inner">{{contact}}</span><i class="begun_adv_vertical-line"><i></i></i></div>\
</div>\
<i class="begun-adv_border-bottom"></i>\
</div>\
'},
		{'banner_horizontal_rich_mini': '\
<div class="begun_adv_cell begun_rich_mini" title="{{fullDomain}}" onclick="{{onclick}}" _url="{{url}}" _banner_id="{{banner_id}}">\
<div class="begun_adv_block">\
{{picture}}\
<div class="begun_adv_row">\
<div class="begun_adv_title"><a class="snap_noshots" target="_blank" href="{{url}}" title="{{fullDomain}}" {{styleTitle}}>{{favicon}}<span>{{title}}</span></a></div>\
<div class="begun_adv_text"><a class="snap_noshots" target="_blank" href="{{url}}" title="{{fullDomain}}"{{styleText}}>{{descr}}</a></div>\
{{bnnr_warn}}\
</div>\
<div class="begun_adv_contact"{{styleContact}}><span class="begun_adv_contact_inner">{{contact}}</span><i class="begun_adv_vertical-line"><i></i></i></div>\
</div>\
<i class="begun-adv_border-bottom"></i>\
</div>\
'},
        {'banner_horizontal_price_domain': '\
<div class="begun_adv_cell" title="{{fullDomain}}" onclick="{{onclick}}" _url="{{url}}" _banner_id="{{banner_id}}">\
<div class="begun_adv_block">\
{{thumb}}\
<div class="begun_adv_row">\
<div class="begun_adv_title"><a class="snap_noshots" target="_blank" href="{{url}}" title="{{fullDomain}}" {{styleTitle}}>{{favicon}}<span>{{title}}</span></a></div>\
<div class="begun_adv_text"><a class="snap_noshots" target="_blank" href="{{url}}" title="{{fullDomain}}"{{styleText}}>{{descr}}</a></div>\
</div>\
</div>\
<i class="begun-adv_border-bottom"></i>\
</div>\
'},
        {'banner_horizontal_rich_price_domain': '\
<div class="begun_adv_cell begun_adv_rich_price_domain" title="{{fullDomain}}" onclick="{{onclick}}" _url="{{url}}" _banner_id="{{banner_id}}">\
<div class="begun_adv_block">\
{{picture}}\
<div class="begun_adv_row">\
<div class="begun_adv_title"><a class="snap_noshots" target="_blank" href="{{url}}" title="{{fullDomain}}" {{styleTitle}}>{{favicon}}<span>{{title}}</span></a></div>\
<div class="begun_adv_text"><a class="snap_noshots" target="_blank" href="{{url}}" title="{{fullDomain}}"{{styleText}}>{{descr}}</a></div>\
</div>\
</div>\
<i class="begun-adv_border-bottom"></i>\
</div>\
'},
        {'banner_horizontal_rich_mini_price_domain': '\
<div class="begun_adv_cell begun_rich_mini" title="{{fullDomain}}" onclick="{{onclick}}" _url="{{url}}" _banner_id="{{banner_id}}">\
<div class="begun_adv_block">\
{{picture}}\
<div class="begun_adv_row">\
<div class="begun_adv_title"><a class="snap_noshots" target="_blank" href="{{url}}" title="{{fullDomain}}" {{styleTitle}}>{{favicon}}<span>{{title}}</span></a></div>\
<div class="begun_adv_text"><a class="snap_noshots" target="_blank" href="{{url}}" title="{{fullDomain}}"{{styleText}}>{{descr}}</a></div>\
</div>\
</div>\
<i class="begun-adv_border-bottom"></i>\
</div>\
'}
	],
	"begun_css_tpls": [
		{"block_horizontal": '\
#begun_block_{{block_id}} .begun_adv_common_horizontal {\
    position: relative !important;\
    margin: 10px !important;\
    line-height: 1 !important;\
    font-size: 12px !important;\
    font-family: Arial, "Helvetica CY", "Nimbus Sans L", sans-serif !important;\
    width: auto !important!\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_container {\
    position: relative !important;\
    margin-right: 25px !important;\
    width: auto !important!\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_container:after {\
    content: "" !important;\
    display: block !important;\
    height: 0 !important;\
    clear: both !important;\
    visibility: hidden !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_container_inner {\
    overflow: hidden !important;\
    width: auto !important!\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_cell {\
    float: left !important;\
    width: 24.625% !important;\
    padding-bottom: 17px !important;\
    margin: 0 0 0 0.4% !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.banners_count_1 .begun_adv_cell {\
    float: none !important;\
    width: auto !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.banners_count_2 .begun_adv_cell {\
    width: 49.75% !important;\
    margin: 3px 0 3px 0.4% !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.banners_count_3 .begun_adv_cell {\
    width: 33% !important;\
    margin: 3px 0 3px 0.4% !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.banners_count_5 .begun_adv_cell {\
    width: 19.64% !important;\
    margin: 3px 0 3px 0.4% !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.banners_count_6 .begun_adv_cell {\
    width: 16.3% !important;\
    margin: 3px 0 3px 0.4% !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.banners_count_7 .begun_adv_cell {\
    width: 13.914285714285714285714285714286% !important;\
    margin: 3px 0 3px 0.4% !important;\
}\
#begun_block_{{block_id}} .begun_adv_container.begun_hover {\
	background-color: transparent !important;\
	border: medium none !important;\
}\
#begun_block_{{block_id}} .begun_adv_container.begun_hover .begun_adv_block:hover {\
	background-color: {{block_hover:backgroundColor}} !important;\
	border: 1px solid {{block_hover:borderColor}} !important;\
}\
#begun_block_{{block_id}} .begun-adv_border-bottom {\
    position: absolute !important;\
    bottom: 0 !important;\
    display: block !important;\
    height: 0 !important;\
    width: 24.625% !important;\
    border-top: 1px solid #ececec !important;\
	border-top: 1px solid {{block:borderColor}} !important;\
}\
#begun_block_{{block_id}} .begun_adv_container.begun_hover .begun_adv_cell:hover .begun-adv_border-bottom {\
	border-color: {{block_hover:borderColor}} !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.banners_count_1 .begun-adv_border-bottom {\
    width: 100% !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.banners_count_2 .begun-adv_border-bottom {\
    width: 49.75% !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.banners_count_3 .begun-adv_border-bottom {\
    width: 33% !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.banners_count_5 .begun-adv_border-bottom {\
    width: 19.64% !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.banners_count_6 .begun-adv_border-bottom {\
    width: 16.3% !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.banners_count_7 .begun-adv_border-bottom {\
    width: 13.914285714285714285714285714286% !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_cell:first-child {\
    margin-left: 0 !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_block {\
    padding-bottom: 20000px !important;\
    border: 1px solid #ececec !important;\
    border: 1px solid {{block:borderColor}} !important;\
    margin-bottom: -20000px !important;\
    margin-left: 0 !important;\
	background-color: {{block:backgroundColor}} !important;\
}\
*:first-child + html #begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_block {\
	zoom: 1;\
	display: block;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_block:after {\
    content: "" !important;\
    display: block !important;\
    height: auto !important;\
    visibility: hidden !important;\
	clear: both !important; \
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_block img {\
    border: none !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_row {\
    padding: 4px 7px 0 !important;\
    overflow: hidden !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_row + .begun_adv_row {\
    padding-top: 0 !important;\
    margin-top: 2px !important;\
    overflow: hidden !important;\
    padding-bottom: 0 !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_title {\
    margin-bottom: 2px !important;\
    font-weight: bold !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_title * {\
    font-weight: bold !important;\
}\
*:first-child + html #begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_title {\
    line-height: 16px !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_title a {\
    text-decoration: none !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_text {\
    margin: 2px 0 !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_text a {\
    text-decoration: none !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_additional-links {\
    margin: 1px 0 !important;\
    font-size: 11px !important;\
}\
*:first-child + html #begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_additional-links {\
    margin: 0 !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_additional-links a {\
    line-height: 1.2 !important;\
    color: #3377b0 !important;\
    margin: 2px 7px 2px 0 !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_additional-links a:first-child {\
    margin-left: 0 !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_warning {\
    font-size: 10px !important;\
    vertical-align: middle !important;\
    color: #ababab !important;\
}\
#begun_block_{{block_id}} .begun_warn_message {\
	margin-top: 3px !important;\
	padding: 0 !important;\
	text-indent: 0 !important;\
}\
*:first-child + html #begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_warning {\
    line-height: 12px !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_icon {\
    display: inline-block !important;\
    margin-right: 3px !important;\
    vertical-align: middle !important;\
    text-decoration: none !important;\
    font-style: normal !important;\
}\
.begun_adv_contact_inner {\
    display: inline-block !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_warning .begun_adv_icon {\
    height: 13px !important;\
    width: 12px !important;\
    vertical-align: middle !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_warning_text {\
    vertical-align: middle !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_contact {\
    position: absolute !important;\
    top: auto !important;\
	bottom: 0 !important;\
    float: right !important;\
    display: block !important;\
    width: 24.625% !important;\
    padding-bottom: 4px !important;\
    margin-top: 0 !important;\
    margin-left: -1px !important;\
    line-height: 13px !important;\
    text-decoration: none !important;\
    text-align: right !important;\
}\
#begun_block_{{block_id}}.begun_auto_rich .banners_count_1 .begun_adv_block .begun_adv_contact,\
#begun_block_{{block_id}}.begun_auto_rich .banners_count_1 .begun_adv_block .begun_adv_contact * {\
	text-align: right !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_contact .begun_adv_contact_inner {\
	padding-right: 7px !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.banners_count_1 .begun_adv_contact {\
    width: 100% !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.banners_count_2 .begun_adv_contact {\
    width: 49.75% !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.banners_count_3 .begun_adv_contact {\
    width: 33% !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.banners_count_5 .begun_adv_contact {\
    width: 19.64% !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.banners_count_6 .begun_adv_contact {\
    width: 16.3% !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.banners_count_7 .begun_adv_contact {\
    width: 13.914285714285714285714285714286% !important;\
}\
*:first-child + html #begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_contact {\
	float: none !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_contact .begun_adv_contact {\
	position: static !important;\
	float: none !important;\
	display: inline !important;\
	padding: 0 !important;\
	font-size: inherit !important;\
	line-height: inherit !important;\
	width: auto !important;\
}\
#begun_block_{{block_id}} .begun_adv_contact,\
#begun_block_{{block_id}} .begun_adv_contact * {\
	line-height: 13px !important;\
}\
#begun_block_{{block_id}} .begun_adv_contact span {\
	padding-right: 0 !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_vertical-line {\
    float: right !important;\
    height: 0 !important;\
    width: 0 !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_vertical-line i {\
    position: absolute !important;\
    bottom: 0 !important;\
    z-index: 1 !important;\
    height: 45px !important;\
    width: 0 !important;\
    margin-left: -1px !important;\
    border-left: 1px solid !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_info-block {\
    position: absolute !important;\
    top: 0 !important;\
    right: 0 !important;\
    float: right !important;\
    height: 100% !important;\
    width: 25px !important;\
    text-align: right !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_info-block img {\
    border: none !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_age {\
    display: block !important;\
    margin-top: 8px !important;\
    font-size: 11px !important;\
    font-weight: bold !important;\
    color: #999 !important;\
}\
#begun_block_{{block_id}} span.begun_adv_age {\
	color: #999999 !important;\
	display: block !important;\
	font-size: 11px !important;\
	font-style: normal !important;\
	font-weight: bold !important;\
	margin-top: 8px !important;\
	padding: 0 !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_sys_logo_new {\
    position: absolute !important;\
    right: 0 !important;\
    bottom: 2px !important;\
    display: block !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_sys_logo_new img {\
	vertical-align: middle !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_sys_logo img {\
    vertical-align: middle !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_image {\
    float: left !important;\
    height: 70px !important;\
    width: 70px !important;\
    margin-bottom: 2px !important;\
    margin-right: 5px !important;\
    position: static !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_rich_mini .begun_adv_image {\
    height: 60px !important;\
    width: 60px !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_image .snap_noshots {\
    position: absolute !important;\
    height: 70px !important;\
    width: 70px !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_rich_mini .begun_adv_image .snap_noshots {\
    height: 60px !important;\
    width: 60px !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_image img {\
    position: relative !important;\
    z-index: 2 !important;\
    margin: 0 !important;\
    vertical-align: middle !important;\
    transition: all 0.3s !important;\
}\
#begun_block_{{block_id}} .begun_adv_thumb .begun_thumb {\
	float: left !important;\
	height: 70px !important;\
	width: 70px !important;\
	border-bottom: none !important;\
	border-right: none !important;\
	margin: 6px 7px !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_title .begun_adv_icon {\
    margin-right: 3px !important;\
    vertical-align: middle !important;\
    max-height: 16px !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_title span {\
    text-decoration: underline;\
    vertical-align: middle;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_rich_price_domain .begun_adv_image {\
    height: 100px !important;\
    width: 100px !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_rich_price_domain .begun_adv_image a{\
    height: 100px !important;\
    width: 100px !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal .begun_adv_rich_price_domain .begun_adv_image a .begun_adv_picture{\
    height: 100px !important;\
    width: 100px !important;\
    left: 0 !important;\
    top: 0 !important;\
    border: 1px solid #d1d1d1 !important;\
}\
#begun_block_{{block_id}} .begun_adv_price_domain .begun_adv_title *{\
	color:#646464 !important;\
	text-decoration: none !important;\
}\
#begun_block_{{block_id}} .begun_adv_price_domain .begun_adv_text *{\
	color:#646464 !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.begun_adv_price_domain .begun_rich_mini .begun_adv_image img {\
    border: 1px solid #d1d1d1 !important;\
}\
#begun_block_{{block_id}} .begun_adv_common_horizontal.begun_adv_price_domain .begun_adv_cell {\
    padding-bottom: 0 !important;\
}\
'}
	]
});
/*$LastChangedRevision$*/
Begun.Autocontext.tplLoaded("begun_tpl_block_horizontal");
