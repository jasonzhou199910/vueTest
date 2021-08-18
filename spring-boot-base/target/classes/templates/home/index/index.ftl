<!DOCTYPE html>
<html>
<title>农村产权竞拍信息 - 竞拍价格、时间 - 农交网</title>
<meta name="keywords" content="耕地竞拍信息,林地竞拍信息,农村宅基地竞拍信息,公益用地竞拍信息,农村集体建设用地竞拍信息,荒地竞拍信息"/>
<meta name="description" content="农交网是农村产权交易合作解决方案提供商，提供耕地、林地、农村宅基地、公益用地、农村集体建设用地、荒地竞拍信息、竞拍价格、竞拍竞价时间、竞拍状态等。"/>
<!-- 新的头部 -->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="renderer" content="ie-stand">
    <meta name="referrer" content="no-referrer">
    <#include "../common/head-link.ftl"/>
</head>
    <#include "../common/head.ftl"/>
	<!-- 当前位置定位 -->
    <div class="auction_hall_position">
    <a href="/">首页</a>
    <span style="padding: 0 10px;">&gt;</span>
    <a class="active" style="color:#D90C19;">产权交易</a>
    </div>
 <!-- 条件筛选 -->
    <div class="auction_hall_condition">
        <table border="1" bordercolor="#E4E4E4" cellspacing="0" cellpadding="0">
            <tr class="auction_tr">
                <td class="auction_td">标的类型</td>
                <td>
                  <div class="auction_all_right2" id="auction_all_right_standard_type">
                       <div class="auction_all_one2">
                         <div class="auction_hall_table_tab auction_hall_table_tab_select" id="standardTypeAll" onclick="selectedStandardType('All','level1')">全部</div>
                        
                            
                                
                                
                                    <div class="auction_hall_table_tab" id="standardType1" onclick="selectedStandardType('1','level1')">农户承包土地经营权 </div>
                                
                            
                  		
                            
                                
                                
                                    <div class="auction_hall_table_tab" id="standardType2" onclick="selectedStandardType('2','level1')">农村集体资源性资产 </div>
                                
                            
                  		
                            
                                
                                
                                    <div class="auction_hall_table_tab" id="standardType3" onclick="selectedStandardType('3','level1')">农村集体经营性资产 </div>
                                
                            
                  		
                            
                                
                                
                                    <div class="auction_hall_table_tab" id="standardType4" onclick="selectedStandardType('4','level1')">农村集体建设用地 </div>
                                
                            
                  		
                            
                                
                                
                                    <div class="auction_hall_table_tab" id="standardType5" onclick="selectedStandardType('5','level1')">宅基地 </div>
                                
                            
                  		
                            
                                
                                
                                    <div class="auction_hall_table_tab" id="standardType6" onclick="selectedStandardType('6','level1')">林权 </div>
                                
                            
                  		
                            
                                
                                
                                    <div class="auction_hall_table_tab" id="standardType7" onclick="selectedStandardType('7','level1')">农业生产设施设备 </div>
                                
                            
                  		
                            
                                
                                
                                    <div class="auction_hall_table_tab" id="standardType8" onclick="selectedStandardType('8','level1')">股权 </div>
                                
                            
                  		
                        </div>
                        
                     </div>
                </td>
            </tr>
            <tr class="auction_tr">
                <td class="auction_td">标的所在地</td>
                <td>
		            
		               <div class="auction_all_left">
	                        <div class="auction_hall_table_tab auction_hall_table_tab_select" id="locInfoall" onclick="selectedLocInfo('all','province')">全部</div>
	                   </div>
		            
		            
                    <div class="auction_all_right">
                        <div class="auction_all_one">
                           <!-- 省 -->
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('1','province')" id="locInfo1">北京</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('2','province')" id="locInfo2">天津</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('3','province')" id="locInfo3">河北</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('15','province')" id="locInfo15">山西</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('27','province')" id="locInfo27">内蒙古</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('40','province')" id="locInfo40">辽宁</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('55','province')" id="locInfo55">吉林</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('65','province')" id="locInfo65">黑龙江</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('79','province')" id="locInfo79">上海</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('80','province')" id="locInfo80">江苏</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('94','province')" id="locInfo94">浙江</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('106','province')" id="locInfo106">安徽</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('124','province')" id="locInfo124">福建</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('134','province')" id="locInfo134">江西</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('146','province')" id="locInfo146">山东</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('164','province')" id="locInfo164">河南</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('182','province')" id="locInfo182">湖北</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('197','province')" id="locInfo197">湖南</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('212','province')" id="locInfo212">广东</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('234','province')" id="locInfo234">广西</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('249','province')" id="locInfo249">海南</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('252','province')" id="locInfo252">重庆</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('253','province')" id="locInfo253">四川</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('275','province')" id="locInfo275">贵州</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('285','province')" id="locInfo285">云南</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('302','province')" id="locInfo302">西藏</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('310','province')" id="locInfo310">陕西</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('321','province')" id="locInfo321">甘肃</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('336','province')" id="locInfo336">青海</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('345','province')" id="locInfo345">宁夏</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('351','province')" id="locInfo351">新疆</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('3250','province')" id="locInfo3250">台湾</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('3251','province')" id="locInfo3251">香港</div>
				                   
				            

				                   
				                   
				                        <div class="auction_hall_table_tab  auction_loc" onclick="selectedLocInfo('3252','province')" id="locInfo3252">澳门</div>
				                   
				            
				            </div>
				            <!-- 市 -->
				            <div class="auction_add_area auction_add_area_one">
				            
				            </div>
				            <!-- 区 -->
				            <div class="auction_add_area auction_add_area_two">
				            

				           </div>
                        </div>
                </td>
            </tr>
            <tr class="auction_tr">
                <td class="auction_td">项目状态</td>
                <td>
                    <div class="auction_hall_table_tab auction_hall_table_tab_select" id="statusall" onclick="selectedStatus('all')">全部</div>
                    
                       <div class="auction_hall_table_tab" id="status1" onclick="selectedStatus('1')">公示中</div>
                    
                       <div class="auction_hall_table_tab" id="status2" onclick="selectedStatus('2')">竞价中</div>
                    
                       <div class="auction_hall_table_tab" id="status3" onclick="selectedStatus('3')">竞价成功</div>
                    
                       <div class="auction_hall_table_tab" id="status4" onclick="selectedStatus('4')">竞价结束</div>
                    
                       <div class="auction_hall_table_tab" id="status8" onclick="selectedStatus('8')">已成交</div>
                    
                </td>
            </tr>
            <tr class="auction_tr">
                <td class="auction_td">报名时间</td>
                <td style="position: relative">
                    <input type="text" class="data_input datas_input" placeholder="请选择日期" id="signStartTimeStr">
                    <img class="input_data_icon" src="/home/picture/data_input.png" alt="data_input"/>

                    <div class="data_input_line"></div>

                    <input type="text" class="data_input2 datas_input" placeholder="请选择日期" id="signEndTimeStr">
                    <img class="input_data_icon input_data_icon2" src="/home/picture/data_input.png" alt="data_input"/>

                   <!--  <div class="input_data_btn" onclick="sign_query()">查询</div> -->
                </td>
            </tr>
            <tr class="auction_tr">
                <td class="auction_td">竞价时间</td>
                <td style="position: relative">
                    <input type="text" class="data_input3 datas_input" placeholder="请选择日期" id="auctionStartTimeStr">
                    <img class="input_data_icon" src="/home/picture/data_input.png" alt="data_input"/>

                    <div class="data_input_line"></div>

                    <input type="text" class="data_input4 datas_input" placeholder="请选择日期" id="endTimeStr">
                    <img class="input_data_icon input_data_icon2" src="/home/picture/data_input.png" alt="data_input"/>

                    <div class="input_data_btn" onclick="auction_query()">查询</div>
                </td>
            </tr>
        </table>
    </div>

    <!-- 共有拍品 -->
    <div class="auction_hall_all">
        <div class="auction_hall_all_title">共有项目（<span id="count_rows">0</span>）</div>
    </div>

    <!-- 项目展示 -->
    <div class="content_display">
    </div>
    <!-- 分页功能 -->

	<nav class="pageing-content  my-paging ">
		<ul id="pageInitialization" class="pagination-sm" style="float: left;"></ul>
		<div class="my-paging-all" style="float: left; margin-left: 15px;font-size: 14px;display:none">共<span id="max_page">0</span>页</div>
	</nav>

<#include "../common/foot.ftl"/>

</body>
</html>

<script src="/home/js/bootstrap-paginator.min.js"></script>

