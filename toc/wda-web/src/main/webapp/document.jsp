<%@page import="com.farm.wda.util.AppConfig"%>
<%@page import="java.io.File"%>
<%@page import="com.farm.wda.Beanfactory"%>
<%@ page language="java" pageEncoding="utf-8"%>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=AppConfig.getString("config.web.title")%></title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #8a8a8a;">
	<jsp:include page="/commons/head.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-body text-center">
						<img alt="type" style="margin: auto;" class="img-responsive"
							src="img/type.png">
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">配置文件docTypeConf.xml</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-6">
								<img src="img/xml.png" alt="xml" />
							</div>
							<div class="col-md-6">
								<ul>
									<li>conf/files:被转换为的文件类型 exname为支持的文件类型名称 filename为生成文件名</li>
									<li>filename的path参数为文件相对路径</li>
									<li>conf/types:文件转换关系对照</li>
									<li>conf/types/name:源文件后缀名</li>
									<li>conf/types/target:目标文件类型，可以生成多种,需要与conf/files/file/exname一致/</li>
									<li>conf/types/target.imp;:转换器的实现类/</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">配置文件config.properties</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-6">
								<img src="img/conf.png" style="width: 100%" alt="xml" />
							</div>
							<div class="col-md-6">
								<ul>
									<li>config.file.dir.path:文件存储地址，需要配置到webroot下</li>
									<li>config.server.openoffice.cmd:openoffice的soffice服务启动命令</li>
									<li>config.rmi.port:rmi绑定端口</li>
									<li>config.filter.encode:web编码字符集</li>
									<li>config.file.encode:文本文件编码字符集</li>
									<li>config.zip.encode:压缩文件解压时中文处理字符集</li>
									<li>config.index:是否启用全文检索</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">编码</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12">
								<img src="img/demo.png" style="width: 100%" alt="xml" />
							</div>
							<div class="col-md-12">
								<pre>
/**
 * 开始生产WEB文档
 * 
 * @param key
 *            文档关键字，后续通过它调用相关资源
 * @param file
 *            原文件
 * @param htmlinfo
 *            被显示的html信息（如文件名称等）
 * @throws ErrorTypeException
 * @throws RemoteException
 */
public void generateDoc(String key, File file, String htmlinfo,String authid) throws ErrorTypeException, RemoteException;

/**
 * 开始生产WEB文档
 * 
 * @param key
 *            文档关键字，后续通过它调用相关资源
 * @param file
 *            原文件
 * @param fileTypeName
 *            扩展名
 * @param htmlinfo
 *            被显示的html信息（如文件名称等）
 * @throws ErrorTypeException
 * @throws RemoteException
 */
public void generateDoc(String key, File file, String fileTypeName, String htmlinfo,String authid)
		throws ErrorTypeException, RemoteException;

/**
 * 获得可以被转换的文件类型
 * 
 * @return
 */
public Set<String> getSupportTypes() throws RemoteException;

/**
 * 文档是否已经生成完毕
 * 
 * @param key
 * @return
 * @throws ErrorTypeException
 */
public boolean isGenerated(String key, String doctype) throws ErrorTypeException, RemoteException;

/**
 * 文档是否有日志记录
 * 
 * @param key
 * @return
 * @throws ErrorTypeException
 */
public boolean isLoged(String key) throws RemoteException;

/**
 * 删除日志（通过日志判断是否生成过文档时，可以通过此方法重新生成文档）
 * 
 * @param key
 * @return
 * @throws ErrorTypeException
 */
public void delLog(String key) throws RemoteException;

/**
 * 获得日志地址
 * 
 * @param key
 * @return
 */
public String getlogURL(String key) throws RemoteException;

/**
 * 获得文档文本字符串
 * 
 * @param key
 * @return
 * @throws ErrorTypeException
 */
public String getText(String key) throws ErrorTypeException, RemoteException;

/**
 * 获得文档信息字符串
 * 
 * @param key
 * @return
 * @throws ErrorTypeException
 */
public String getInfo(String key) throws ErrorTypeException, RemoteException;

/**
 * 获得在线文档浏览的URL
 * 
 * @param key
 * @param exname
 * @return
 * @throws ErrorTypeException
 */
public String getUrl(String key, String docType) throws ErrorTypeException, RemoteException;</pre>
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">RMI调用</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12">
								<pre>WdaAppInter personService = (WdaAppInter) Naming.lookup("rmi://127.0.0.1:8888/wda");
personService.generateDoc("1234", new File("D:\\doc\\1.docx"),"权限id,默认为null");</pre>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>