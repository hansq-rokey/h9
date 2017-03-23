package org.apache.jsp.WEB_002dINF.view.jsp.ui.enterprise;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class attractb02_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("\t<meta charset=\"UTF-8\">\r\n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no\"/>  \r\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/partner.css\">\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/plug/jQuery/jquery-1.8.3.min.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/plug/layer/layer.js\"></script>\r\n");
      out.write("\t<title>熊爸爸温暖屋-消费升级风口下的赚钱项目</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<div class=\"partnerPC-mian partner-mian\" id=\"partnerPC\">\r\n");
      out.write("\t\t<p><img src=\"../../img_new/PcbImg1/partnerPC01.jpg\"></p>\r\n");
      out.write("\t\t<p><img src=\"../../img_new/PcbImg1/partnerPC02.jpg\"></p>\r\n");
      out.write("\t\t<p><img src=\"../../img_new/PcbImg1/partnerPC03.jpg\"></p>\r\n");
      out.write("\t\t<p><img src=\"../../img_new/PcbImg1/partnerPC04.jpg\"></p>\r\n");
      out.write("\t\t<p><img src=\"../../img_new/PcbImg1/partnerPC05.jpg\"></p>\r\n");
      out.write("\t\t<p><img src=\"../../img_new/PcbImg1/partnerPC06.jpg\"></p>\r\n");
      out.write("\t\t<p><img src=\"../../img_new/PcbImg1/partnerPC07.jpg\"></p>\r\n");
      out.write("\t\t<p><img src=\"../../img_new/PcbImg1/partnerPC08.jpg\"></p>\r\n");
      out.write("\t\t<p><img src=\"../../img_new/PcbImg1/partnerPC09.jpg\"></p>\r\n");
      out.write("\t\t<p><img src=\"../../img_new/PcbImg1/partnerPC10.jpg\"></p>\r\n");
      out.write("\t\t<p><img src=\"../../img_new/PcbImg1/partnerPC11.jpg\"></p>\r\n");
      out.write("\t\t<p><img src=\"../../img_new/PcbImg1/partnerPC12.jpg\"></p>\r\n");
      out.write("\t\t<p><img src=\"../../img_new/PcbImg1/partnerPC13.jpg\"></p>\r\n");
      out.write("\t\t<p><img src=\"../../img_new/PcbImg1/partnerPC14.jpg\"></p>\r\n");
      out.write("\t\t<p><img src=\"../../img_new/PcbImg1/partnerPC15.jpg\"></p>\r\n");
      out.write("\t\t<p><img src=\"../../img_new/PcbImg1/partnerPC16.jpg\"></p>\r\n");
      out.write("\t\t<div class=\"partner-Pc-Submit\">\r\n");
      out.write("\t\t\t<img class=\"subimg\" src=\"../../img_new/PcbImg1/subming.png\"> \r\n");
      out.write("\t\t\t<div class=\"partner-Pc-form\">\r\n");
      out.write("\t\t\t\t<ul class=\"partner-input\">\r\n");
      out.write("\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t<label class=\"partner-color\">姓名:</label>\r\n");
      out.write("\t\t\t\t\t\t<input class=\"i-height name\" type=\"text\"  id=\"user_name\" name=\"\">\r\n");
      out.write("\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t<label class=\"partner-color\">意向城市:</label>\r\n");
      out.write("\t\t\t\t\t\t<input class=\"i-height city\" type=\"text\" id=\"user_city\" name=\"\">\r\n");
      out.write("\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t<label class=\"partner-color\">电话:</label>\r\n");
      out.write("\t\t\t\t\t\t<input class=\"i-height number\" id=\"user_telephone\" type=\"text\" name=\"\">\r\n");
      out.write("\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t<label class=\"partner-color\">投资金额:</label>\r\n");
      out.write("\t\t\t\t\t\t<select class=\"i-height investment-amount\"  id=\"investmentValue\">\r\n");
      out.write("\t\t\t\t\t\t\t<option>10~20万</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option>20~50万</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option>50~100万</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option>100万以上</option>\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t<label class=\"partner-color\">&nbsp&nbsp&nbsp&nbsp备注:</label>\r\n");
      out.write("\t\t\t\t\t\t<textarea class=\"remark\" id=\"comment\"></textarea>\r\n");
      out.write("\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t<a class=\"partner-sub\" id=\"footer_submit\" href=\"###\">提交</a>\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" id=\"investMoney\" />\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" id=\"type\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${type }", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" />\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" id=\"pageValue\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageValue }", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" />\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" id=\"advertValue\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${advertValue }", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("\" />\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<script>\r\n");
      out.write("\t$(function(){\r\n");
      out.write("\t\t$(\"#user_telephone\").on('change', function(e) {\r\n");
      out.write("\t\t\tvar mycalls=/^(((13[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|177|170|176|178|171|145|147|(18[0-9]{1}))+\\d{8})$/;\r\n");
      out.write("\t\t\tvar content=$(this);\r\n");
      out.write("\t\t\tvar tell=content.val();\r\n");
      out.write("\t\t\tif(!mycalls.test(tell)){ \r\n");
      out.write("\t\t\t\tcontent.val('');\r\n");
      out.write("\t\t\t\tlayer.msg('号码输入有误');\r\n");
      out.write("\t\t\t    return false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$(\"#investmentValue\").on('change',function(e){\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tvar investMoney = $(\"#investMoney\");\r\n");
      out.write("\t\t\tvar thisValue =$(this).val();\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\tinvestMoney.val(thisValue);\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t$(\"#user_city\").on('change', function(e) {\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tvar that = $(this);\r\n");
      out.write("\t\t\tvar tell = $(this).val();\r\n");
      out.write("\t\t\tcheckStr(tell,that);\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("\tfunction checkStr(str,that){\r\n");
      out.write("\t\tvar myReg = /^[\\u4e00-\\u9fa5][\\u4e00-\\u9fa5]+$/;\r\n");
      out.write("\t    \r\n");
      out.write("\t    if(!myReg.test(str) ) {\r\n");
      out.write("\t      layer.msg('意向城市输入有误');\r\n");
      out.write("\t      that.val(\"\");\r\n");
      out.write("\t      return false;\r\n");
      out.write("\t    }\r\n");
      out.write("\t\treturn true;\r\n");
      out.write("\t  }\r\n");
      out.write("\t  \r\n");
      out.write("\t$(\"#footer_submit\").on(\"click\",function() {\r\n");
      out.write("\t    \r\n");
      out.write("\t\tvar name=$('#user_name').val();\r\n");
      out.write("\t    var tel=$('#user_telephone').val();\r\n");
      out.write("\t    var cities=$('#user_city').val();\r\n");
      out.write("\t    var comment=$('#comment').val();\r\n");
      out.write("\t    var type=$('#type').val();\r\n");
      out.write("\t    var pageValue=$('#pageValue').val();\r\n");
      out.write("\t    var advertValue=$('#advertValue').val();\r\n");
      out.write("\t    var investMoney = $(\"#investMoney\").val();\r\n");
      out.write("\t    //默认值\r\n");
      out.write("\t   \tif(investMoney==\"\"){\r\n");
      out.write("\t   \t\tinvestMoney = \"10~20万\";\r\n");
      out.write("\t   \t}\r\n");
      out.write("\t    if(name==''||tel==''||cities==''){\r\n");
      out.write("\t    \treturn false;\r\n");
      out.write("\t    }\r\n");
      out.write("\t    \r\n");
      out.write("\t    $.ajax({\r\n");
      out.write("\t\t\ttype: \"POST\",\r\n");
      out.write("\t\t\tdata:{name:name,tel:tel,cities:cities,remark:comment,adType:type,pageValue:pageValue,advertValue:advertValue,investMoney:investMoney},\r\n");
      out.write("\t\t\turl: \"/join/add.html\",\r\n");
      out.write("\t\t\tdataType:'text',\r\n");
      out.write("\t\t\tsuccess: function(data) {\r\n");
      out.write("\t\t\t\tif(data=='success'){\r\n");
      out.write("\t\t\t\t    $('#user_name').val('');\r\n");
      out.write("\t\t\t\t    $('#user_telephone').val('');\r\n");
      out.write("\t\t\t\t    $('#user_city').val('');\r\n");
      out.write("\t\t\t\t    $('#comment').val('');\r\n");
      out.write("\t\t\t\t\t/* alert('恭喜信息提交成功，稍后工作人员会与您取得联系！'); */\r\n");
      out.write("\t\t\t\t    layer.alert('恭喜信息提交成功，稍后工作人员会与您取得联系！')\r\n");
      out.write("\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\tlayer.msg('出错啦！');\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t})\r\n");
      out.write("\t}); \r\n");
      out.write("\t</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
