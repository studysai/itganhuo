<%@ page language="java" pageEncoding="UTF-8" import="cn.itganhuo.app.common.utils.DateUtil" %>
<footer id="footer">
    <div class="container">
        <div class="row inner hidden-xs">
            <dl class="col-sm-2 site-link">
                <dt>网站相关</dt>
                <dd><a href="<%=request.getContextPath() %>/about" target="_blank">关于我们</a></dd>
                <dd><a href="<%=request.getContextPath() %>/teams" target="_blank">开发团队</a></dd>
                <dd><a href="<%=request.getContextPath() %>/devblog" target="_blank">开发日志</a></dd>
<%--                <dd><a href="<%=request.getContextPath() %>/tos">服务条款</a></dd>--%>
<%--                <dd><a href="<%=request.getContextPath() %>/faq">帮助中心</a></dd>--%>
<%--                <dd><a href="<%=request.getContextPath() %>/q/1010000000187808">编辑器语法</a></dd>--%>
<%--                <dd><a href="http://weekly.www.itganhuo.cn/">每周精选</a></dd>--%>
            </dl>
            <dl class="col-sm-2 site-link">
                <dt>联系合作</dt>
                <dd><a href="javascript:alert('本站资源如有侵犯你的权益敬请联系mx.tian#qq.com（将#换成@）。');">联系我们</a></dd>
<%--                <dd><a href="<%=request.getContextPath() %>/hiring">加入我们</a></dd>--%>
<%--                <dd><a href="<%=request.getContextPath() %>/link">合作伙伴</a></dd>--%>
<%--                <dd><a href="<%=request.getContextPath() %>/press">媒体报道</a></dd>--%>
<%--                <dd><a href="http://0x.www.itganhuo.cn">建议反馈</a></dd>--%>
            </dl>
            <dl class="col-sm-2 site-link">
                <dt>常用链接</dt>
                <dd><a href="http://sishuok.com/" target="_blank">私塾在线</a></dd>
                <dd><a href="http://www.oschina.net/" target="_blank">开源中国</a></dd>
            </dl>
            <dl class="col-sm-2 site-link">
                <dt>关注我们</dt>
<%--                <dd><a href="<%=request.getContextPath() %>/feeds">问答 RSS 订阅</a></dd>--%>
                <dd><a href="javascript:alert('我是QQ群号')" target="_blank">329232140</a></dd>
            </dl>
            <dl class="col-sm-4 site-link" id="license">
                <dt>内容许可</dt>
                <dd>除特别说明外，用户内容均采用 <a rel="license" target="_blank" href="http://creativecommons.org/licenses/by-sa/3.0/cn/">知识共享署名-相同方式共享 3.0 中国大陆许可协议</a> 进行许可</dd>
            </dl>
        </div>
        <div class="copyright">Copyright &copy; 2014-<%=DateUtil.getNowDateTimeStr("yyyy") %> ItGanHuo. 当前呈现版本 2014.11.24<br>粤ICP备14073525号-1</div>
    </div>
</footer>
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F3ce6f0c72e530455019b23502192a6ee' type='text/javascript'%3E%3C/script%3E"));
</script>
