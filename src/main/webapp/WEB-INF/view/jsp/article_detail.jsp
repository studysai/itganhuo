<%@ page language="java" import="java.util.*,cn.itganhuo.app.entity.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" href="<%=path %>/css/style.css" />
<link rel="stylesheet" href="<%=path %>/css/responsive.css" />
<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
<title>${article.title}-IT干货技术分享网</title>
</head>
<body id="body">
<%@ include file="common/f_header1.jsp" %>
<%@ include file="common/f_header2.jsp" %>

<div class="container wrap">
    <div class="row inner edge">
        <div class="col-md-12">
            <h1 class="top-title">${article.title}</h1>
        </div>
        <div id="main" class="col-md-9 col-xs-12">
            <div id="question">
                <article class="q-post" >
                    <div class="post-cell">
                        <a href="javascript:addUseful('${article.id}','article');" class="post-big-vote"><span id="${article.id}_zan_article">${article.useful}</span>赞</a>
                        <a href="javascript:addUseless('${article.id}','article');" class="post-big-hate" data-toggle="tooltip" data-placement="right" rel="tooltip" title="谨慎使用"><span id="${article.id}_cai_article">${article.useless}</span>踩</a>
                        <a href="###" class="post-fav" data-toggle="tooltip" data-placement="right" rel="tooltip" title="关注并收藏">收藏</a>
                    </div>
                    <div class="fmt post-content">
                        <p>${article.content}</p>
                    </div>
                    
                    <div class="post-foot">
                    	<%--
                        <div class="hor-tabs post-action">
                            <a href="http://itganhuo.cn/q/1010000000644839" class="i-link">链接</a>
                            <a href="http://itganhuo.cn/q/1010000000644839/edit" class="i-edit" data-toggle="tooltip" data-placement="bottom" rel="tooltip" title="修改问题后回答者会收到提醒">修改</a>
                            <a href="#" class="i-flag">操作</a>
                        </div>
                         --%>
                        <table class="post-parter">
                            <tr>
                                <td>
                                    <a href="<%=path%>/user/${article.user.account}" tabindex="-1"><img class="avatar-32" src="<%=path %>/photo/${article.user.account}.jpg" alt="${article.user.account}" onerror="showErrImg(this);"/></a>
                                </td>
                                <td class="post-author">
                                    <h4><a href="<%=path%>/user/${article.user.account}">${article.user.account}</a><strong>6</strong></h4>${article.post_date}<br />
                                </td>
                            </tr>
                        </table>
                        <%--
                        <ul class="comment-list">
                            <li>
                                <a class="more-comments" href="#" data-url="http://itganhuo.cn/api/comment?do=show&id=1010000000644839">显示评论 (1条)</a>
                            </li>
                        </ul>
                         --%>
                    </div>
                </article>
            </div>
            
            <!-- 评论开始 -->
            <div id="answer">
                <div class="hor-tabs right">
                    <a class="current by-votes" href="#">得票数</a>
                    <i></i>
                    <a class="by-created" href="#">时间先后</a>
                </div>
                <h2 class="a-title"> ${article.comments.size()} 个回答</h2>
            <%--
                <div class="iamgg-main rounded-2">
                    <small><a href="http://itganhuo.cn/advertise">赞助商广告</a></small>
                </div>
            --%>
               
	            <c:choose>
		            <c:when test="${article.comments.size() > 0 and article.comments[0].id != ''}">
		              <c:forEach items="${article.comments }" var="comment">
		                <article class="a-post accepted" >
		                    <div class="post-cell">
		                        <a href="javascript:addUseful('${comment.id}','comment');" class="post-big-vote"><span id="${comment.id}_zan_comment">${comment.praise }</span>赞</a>
		                        <a href="javascript:addUseless('${comment.id}','comment');" class="post-big-hate" data-toggle="tooltip" data-placement="right" rel="tooltip" title="谨慎使用"><span id="${comment.id}_cai_comment">${comment.trample}</span>踩</a>
		                        <div class="accept-mark" title="采纳答案">采纳</div>
		                    </div>
		                    <div class="fmt post-content">
		                        <p>${comment.content }</p>
		                    </div>
		                    <div class="post-foot">
		                        <div class="hor-tabs post-action">
		                            <a class="btn btn-default btn-sm active btn-s btn-accept" data-cancel="1" href="###">取消采纳</a>
		                            <i></i>
		                            <a href="#" class="i-link">链接</a> 
		                            <a class="i-ignore ignore" href="#" data-cancel="0">忽略</a>
		                        </div>
		                        <table class="post-parter">
		                            <tr>
		                                <td>
		                                    <img class="avatar-32" src="${pageContext.request.contextPath}/photo/${comment.user.account}.jpg" alt="图片" onerror="showErrImg(this);" />
		                                </td>
		                                <td class="post-author">
		                                    <h4><a href="<%=path %>/user/${comment.user.account}">${comment.user.account}</a><strong>0</strong></h4>${comment.post_date }
		                                </td>
		                            </tr>
		                        </table>
		                        <ul class="comment-list">
		                            <li>
		                                <a class="more-comments" href="javascript:toggle('j_reply_li_${comment.id}');">有问题问他</a>
		                            </li>
		                            <li id="j_reply_li_${comment.id}" style="display: none">
		                            	<input type="text" id="j_reply_${comment.id}" style="width: 90%">&nbsp;
		                            	<c:if test="${user_model == null || user_model.id == '' }">
		                            		<input type="button" value="提交" onclick="javascript:window.location.href='<%=path%>/user/signin';">
		                            	</c:if>
		                            	<shiro:authenticated>
				                    		<input type="button" value="提交" onclick="submitReply('j_reply_${comment.id}','${comment.id}');">
				                    	</shiro:authenticated>
		                            </li>
						            <c:if test="${comment.replys != null and comment.replys.size() > 0}">
			                            <li>
						              	<c:forEach items="${comment.replys }" var="reply">
			                            	<div>
											  <div style="width: 500px;float: left;">${reply.content }</div>
											  <div style="text-align: right;width: 100%;float: right;">${reply.post_date }&nbsp;&nbsp;${reply.user.account }</div>
											</div>
			                          	</c:forEach>
			                            </li>
			                        </c:if>
		                        </ul>
		                    </div>
		                </article>
		             </c:forEach>
		            </c:when>
		           	<c:otherwise>
		           		<p>快来抢沙发</p>
		           	</c:otherwise>
	           </c:choose>
            </div>
                    
            <div id="write-answer">
                <h2 class="common-title">我有话说</h2>
                <c:choose>
	                <c:when test="${user_model.id != article.user_id }">
		                <form method="post" action="<%=path%>/user/comment" onsubmit="return checkForm();">
		                    <div id="wmd-button-bar">
		                    	<input type="hidden" name="object_id" value="${article.id }">
		                    	<input type="hidden" name="article_user_id" value="${article.user_id }">
		                    	<textarea placeholder="用词请文明" rows="8" cols="115" id="j_content" name="content" style="resize: none;overflow-y:auto;"></textarea>
		                    	<input type="submit" id="j_sub" value="提交">
		                    </div>
		                </form>
	                </c:when>
	                <c:otherwise>
	                	<div id="wmd-button-bar">
	                    	<textarea placeholder="不能评论自己的话题哦！" readonly="readonly" rows="8" cols="115" id="j_content" name="content" style="resize: none;overflow-y:auto;"></textarea>
	                    	<input type="submit" disabled="disabled" value="提交">
	                    </div>
	                </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div id="secondary" class="col-md-3 col-xs-12 hidden-xs hidden-sm">
            <aside class="q-info">
                <ul class="hor-count">
                    <li><strong>${article.visitor_volume}</strong>浏览数</li>
                    <li><strong>0</strong>收藏数</li>
                </ul>
                <%--
                <ul class="tag-ranking-list show-pop-tag edit-disabled">
                    <li>
                        <a data-tid="1040000000090338" href="http://itganhuo.cn/t/markdown" class="tag">markdown</a>
                    </li>
                    <li>
                        <a data-tid="1040000000089449" href="http://itganhuo.cn/t/java" class="tag tag-img" style="background-image: url(http://sfault-avatar.b0.upaiyun.com/354/807/3548072706-i-1040000000089449_icon);">java</a>
                    </li>
                </ul>
                 --%>
            </aside>

			<%--
            <div class="iamgg-sidebar rounded-2">
                <script type="text/javascript" src="http://cbjs.baidu.com/js/m.js"></script>
                <script type="text/javascript">BAIDU_CLB_fillSlot("656843");</script>
            </div>
            <aside class="box invite-to-answer">
                <a href="#" class="btn btn-default btn-l">邀请大大回答</a>
                <ul class="invited-list"></ul>
            </aside>
             --%>
            
            <div class="qa-aside-pin">
            	<%--
                <aside class="input-share box fix-top">
                    <h3>转发分享</h3>
                    <input title="本页网址" type="text" class="form-control input-sm mono text-27" readonly value="http://sfau.lt/bNcRUN" /><br />
                    <a target="_blank" href="http://itganhuo.cn/share/weibo/1010000000644839" class="i-weibo">微博</a>
                    <a target="_blank" href="http://itganhuo.cn/share/twitter/1010000000644839" class="i-twitter">Twitter</a>
                    <a target="_blank" href="http://itganhuo.cn/share/renren/1010000000644839" class="i-renren">人人网</a>
                    <a target="_blank" href="http://itganhuo.cn/share/qq/1010000000644839" class="i-tqq">腾讯微博</a>
                    <a target="_blank" href="http://itganhuo.cn/share/douban/1010000000644839" class="i-douban">豆瓣</a>
                </aside>
                 --%>
                <aside class="box">
                    <h3>相关文章</h3>
                    <ul class="link-list">
	                    <c:forEach items="${related_article}" var="article" begin="1" end="15">
	                        <li ><a class="topic_title" href="<%=path %>/article/${article.id}">
								<c:choose>
								   <c:when test="${fn:length(article.title) > 12}">
								  	 <c:out value="${fn:substring(article.title, 0, 12)}......" />
								   </c:when>
								   <c:otherwise>
								   	  <c:out value="${article.title}" />
								   </c:otherwise>
								  </c:choose>
	     					</a></li>
	                    </c:forEach>
                    </ul>
                </aside>
            </div>
        </div>
    </div>

<%--
    <div id="invite-popup" class="">
        <p class="hor-tabs">
            <a href="#" data-by="username" class="current">站内邀请</a>
            <i></i>
            <a href="#" data-by="email">Email 邀请</a>
            <i></i>
            <a href="#" data-by="weibo">新浪微博邀请</a>
        </p>
        <div id="by-username" class="reged-user">
            <div class="search-user p">
                <input class="text-28 form-control" type="text" placeholder="输入对方用户名" />
            </div>
            <ul class="invited-list"></ul>
            <p>您可以邀请站内用户来解答问题<br />有针对性的邀请才能提高问题解决效率</p>
        </div>
        <div id="by-email" class="unreg-user hidden">
            <div class="p"><input class="text-28 form-control" type="email" placeholder="Email 地址" /></div>
            <div class="p"><textarea class="textarea-13 form-control" rows="5"></textarea></div>
        </div>
        <div id="by-weibo" class="unreg-user hidden">
            <p>绑定新浪微博后才能邀请 <a href="http://itganhuo.cn/user/settings?tab=auth" target="_blank">绑定 &#8617;</a></p>
        </div>
    </div>
    --%>
</div>

<%--
<div class="container feed-link">
    <a href="http://itganhuo.cn/feeds/q/1010000000644839"><i class="i-feed"></i>订阅本页 RSS</a>
</div>
 --%>

<%@ include file="common/f_footer.jsp" %>

<a id="backtop" class="mobi-hide hidden" href="#body">回顶部</a>

</body>
<script type="text/javascript">
//当图片丢失时显示默认图片
function showErrImg(obj) {
    var errorimg = "<%=path%>/imgs/default_image.jpg";
    obj.src = errorimg;
}
//提交评论内容时前端验证
function checkForm() {
	jQuery('#j_sub').attr('disabled',true);
	var content = jQuery('#j_content').val();
	if (content == null || content == '') {
		alert('请填写评论内容');
		jQuery('#j_content').focus();
		jQuery('#j_sub').attr('disabled',false);
		return false;
	}
	return true;
}
//显示或隐藏回复框
function toggle() {
    var arg = arguments;
    for(var i in arg){
        var one = typeof(arg[i]) === 'string'?document.getElementById(arg[i]):arg[i];
        one.style.display == 'block' ? one.style.display = 'none' : one.style.display = 'block';
    }
}
// 编码转换
var GB2312UnicodeConverter = {
    ToUnicode: function (str) {
        return escape(str).toLocaleLowerCase().replace(/%u/gi, '\\u');
    }
    , ToGB2312: function (str) {
        return unescape(str.replace(/\\u/gi, '%u'));
    }
};
//异步提交回复数据
function submitReply(id,comment_id) {
	var content = jQuery('#' + id).val();
	if (content == null || content == '') {
		alert('不填内容就点提交你也太调皮了吧！');
		return;
	}
	jQuery.post('<%=path%>/article/saveReply', {content:content, comment_id:comment_id}, function(data) {
		if (data != null || data != '') {
			alert(data.message);
		}
	},"json");
	window.location.reload();
}
//文章或者评论点赞 类型为article表示文章 类型为 comment表示评论
function addUseful(id,type){
	var url = "";
	if(type == "article"){
		url = "<%=path%>/article/addUsefulById/"+id;
	}else if(type ="comment"){
		url = "<%=path%>/article/addPraiseById/"+id;
	}else ;
	$.get(url,function(data){
		var json = jQuery.parseJSON(data);
		if(json.status > 0){
			if(type == "article"){
				$("#"+id+"_zan_article").html(json.status);
			}else if(type ="comment"){
				$("#"+id+"_zan_comment").html(json.status);
			}else ;
		}else{
				alterMsg(json.msg);
		}
	});
}
//文章或者评论点踩 类型为article表示文章 类型为 comment表示评论
function addUseless(id,type){
	var url = "";
	if(type == "article"){
		url = "<%=path%>/article/addUselessById/"+id;
	}else if(type ="comment"){
		url = "<%=path%>/article/addTrampleById/"+id;
	}else ;
	$.get(url,function(data){
		var json = jQuery.parseJSON(data);
		if(json.status > 0){
			if(type == "article"){
				$("#"+id+"_cai_article").html(json.status);
			}else if(type ="comment"){
				$("#"+id+"_cai_comment").html(json.status);
			}else ;
		}else{
			alterMsg(json.msg);
		}
	});
}
function alterMsg(msg){
	if(msg =="unlogin"){
		alert("该操作需要先登录哦~亲！！");
		location.href='<%=path%>/user/signin';
	}else if(msg =="addUsefulOrUseless_onOwn"){
		alert("不能对自己发表的文章或者评论执行该操作哦~亲！！");
	}else if(msg == "addUsefulOrUseless_again"){
		alert("不能重复对文章或者评论执行该操作哦~亲！！");
	}else if(msg == "addFailure"){
		alert("服务器正忙，请稍后再试~");
	}
}
</script>
</html>