<!-- 新的头部 -->
<body>
<div class="right-nav">
    <ul>
        <li>
            <img src="/home/picture/kefu_icon.png" alt="">
            <p>客服</p>
            <div class="qr-code">
                <img src="/home/picture/kefu_qr_code.png" alt="">
                <p>农交客服</p>
                <p>扫码咨询</p>
            </div>
        </li>
        <li>
            <img src="/home/picture/qr_code_icon.png" alt="">
            <p>二维码</p>
            <div class="qr-code">
                <img src="/home/picture/weixin_qr_code.png" alt="">
                <p>官方微信</p>
                <p>关注有礼</p>
            </div>
        </li>
        <li class="qr-code-box">
            <img src="/home/picture/qr_code_icon.png" alt="">
            <p>APP</p>
            <div class="qr-code">
                <img src="/home/picture/app_download.png" alt="">
                <p>农交网APP</p>
                <p>扫码下载</p>
            </div>
        </li>
        <li class="back-top">
            <img src="/home/picture/top_icon.png" alt="">
            <p>顶部</p>
        </li>
    </ul>
</div>
<!-- 公用头部 -->
<div class="head">
    <div class="contain">
        <div class="head_top">
            <div class="head_logo">
                <a href="/home/index/index">
                    <img src="/home/picture/head_logo.png" alt="head_logo"/>
                </a>
            </div>
            <div class="logo_font">农村产权交易服务平台</div>

            <div class="head_input_bg">
                <input type="text" placeholder="输入竞拍关键字搜索" value="" id="search_value"/>
                <img src="/home/picture/head_search.png" alt="head_search" onclick="search()"/>
            </div>


            <span id="userDiv">
		                <div class="head_login frist_login" style="margin-top: 14px;" id="head_login">
		                    <img  style="margin-top: 11px;" src="/home/picture/head_login.png" style="margin-top: 14px;cursor:pointer;" alt="head_login"/>
		                    <span>竞价登录</span>
		                </div>
		                <div class="head_sign last_sign" style="margin-top: 14px;cursor:pointer;" id="head_sign">
		                    <img src="/home/picture/head_sign.png"  alt="head_sign"/>
		                    <span>注册</span>
		                </div>
					</span>
        </div>

        <div class="head_tab">
            <a id="homePage" href="/home/index/index" class="head_tab_select">首页</a>
            <a id="auctionHall" href="#">产权交易</a>
            <a id="auctionList" href="#">竞价大厅</a>
            <a id="mechanism"href="#">交易机构</a>
            <a id="solution" href="#">解决方案</a>
            <a id="head_news"href="#">新闻资讯</a>
            <a id="industrData" href="#">行业数据</a>
            <a id="head_project" href="#">项目专区</a>
            <a id="announcements" href="#">公告</a>

        </div>
    </div>
</div>


<style type="text/css">

    .sa-confirm-button-container button {
        background: #D01219 !important;
    }

    .footer_title{
        height: auto !important;
        line-height: 25px !important;
        font-size: 16px !important;
        color: #FFFFFF !important;
        padding-top: 38px !important;
    }
    .captitle-content{
        float: left;
        font-size: 14px;
        margin-left: 15px;
        max-width:200px;
        word-wrap:break-word;
        text-overflow:ellipsis;
        white-space:nowrap;
        overflow:hidden;
    }

    /*.captitle-content:hover{*/
    /*    max-width:800px;*/
    /*    white-space:normal;*/
    /*    overflow:auto;*/
    /*}*/
</style>