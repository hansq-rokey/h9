package org.apache.jsp.WEB_002dINF.view.jsp.ui.enterprise;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class error_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("<!doctype html>\n");
      out.write("<html>\n");
      out.write(" <head>\n");
      out.write("  <title>访问错误页面</title>\n");
      out.write("  <meta name=\"keywords\" content=\"白熊支付\">\n");
      out.write("  <meta name=\"description\" content=\"白熊扫码支付\">\n");
      out.write("  <meta name=\"content-type\" content=\"text/html;charset=gbk\">\n");
      out.write("      <meta http-equiv=\"Content-Type\" content=\"text/html;charset=UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no\"  />\n");
      out.write("    <!--\n");
      out.write("        telephone=no：禁止自动将页面中的数字识别为电话号码\n");
      out.write("        address=no：禁止自动地址转为链接\n");
      out.write("        email=no：禁止自动将email转为链接\n");
      out.write("    -->\n");
      out.write("    <meta name=\"format-detection\" content=\"telephone=no,address=no,email=no\" />\n");
      out.write("    <!-- 强制将页面布局为一列 -->\n");
      out.write("    <meta name=\"mobileOptimized\" content=\"width\" />\n");
      out.write("    <!-- 申明页面是移动友好的 -->\n");
      out.write("    <meta name=\"handheldFriendly\" content=\"true\" />\n");
      out.write("    <!-- 允许用户使用全屏模式浏览 -->\n");
      out.write("    <meta name=\"apple-mobile-web-app-capable\" content=\"yes\" />\n");
      out.write("    <!-- 当用户使用全屏浏览时，将状态条设置为黑色 -->\n");
      out.write("    <meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\" />\n");
      out.write("    <meta name=\"keyword\" content=\"熊爸爸，暖魔方，浴室款，健康，智能，省电\"/>\n");
      out.write("    <link href=\"/css/common.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("    <title>访问错误页面</title>\n");
      out.write("    <style>\n");
      out.write("    header{\n");
      out.write("        height:140px;\n");
      out.write("    }\n");
      out.write("    .container{\n");
      out.write("        width: 100%;\n");
      out.write("        padding:0 16px;\n");
      out.write("        margin-top:-55px;\n");
      out.write("    }\n");
      out.write("    .content{\n");
      out.write("    \twidth:100%;\n");
      out.write("    \tbackground:#fff;\n");
      out.write("    \toverflow:hidden;\n");
      out.write("        -webkit-border-radius: 3px;\n");
      out.write("        -moz-border-radius:3px ;\n");
      out.write("        border-radius: 3px;\n");
      out.write("        box-shadow: 0px 0px 10px 0px rgba(4, 0, 0, 0.3);\n");
      out.write("        padding-bottom:20px;\n");
      out.write("    }\n");
      out.write("    .pay-error-icon{\n");
      out.write("    \twidth:80px;\n");
      out.write("    \theight:auto;\n");
      out.write("        display:block;\n");
      out.write("    \tmargin:35px auto;\n");
      out.write("    }\n");
      out.write("    .error-text{\n");
      out.write("    \ttext-align:center;\n");
      out.write("    \tcolor:#858585;\n");
      out.write("    \tmargin-bottom:30px;\n");
      out.write("    }\n");
      out.write("    .pay-link{\n");
      out.write("    \ttext-align:right;\n");
      out.write("    \tcolor:#858585;\n");
      out.write("    }\n");
      out.write("    .pay-link a{\n");
      out.write("    \tdisplay:inline-block;\n");
      out.write("    \tpadding:10px 16px;\n");
      out.write("    }\n");
      out.write("    .pay-link a.pay-again{\n");
      out.write("    \tcolor:#fb0035;\n");
      out.write("    }\n");
      out.write("    </style>\n");
      out.write(" </head>\n");
      out.write("\n");
      out.write(" <body>\n");
      out.write(" <header>\n");
      out.write("</header>\n");
      out.write("\t<div align=\"center\" id=\"\">\n");
      out.write("\t\t<p >\n");
      out.write("\t\t访问失败，路径中包含非法字符\n");
      out.write("\t\t<br><br>\n");
      out.write("\t\t</p>\n");
      out.write("\t</div>\n");
      out.write(" </body>\n");
      out.write("</html>\n");
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
