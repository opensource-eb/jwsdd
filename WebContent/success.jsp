

<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Bootstrap Table Examples</title>
</head>	
    
<body>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">    
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap-table.css">	
<script src="jquery.js"></script>
<script src="bootstrap.js"></script>
<script src="bootstrap-table.js"></script>




Welcome <%=session.getAttribute("userid")%> <br/>
<a href='add_deal_form.jsp'>Add deal</a><br/>
<a href='logout.jsp'>Log out</a><br/>
<table id="demo" >
</table>
<br/>

<script>

$('#demo').bootstrapTable({
  columns:[ //欄位設定
    {field:'checkbox', title:'選取', align:'center', width:80, visible:true, checkbox:true},
    {field:'id', title:'代號', align:'center', width:120, visible:true, sortable:true},
    {field:'name', title:'名稱', align:'left', visible:true},
    {field:'mailAddress', title:'Email', align:'left', width:200, visible:true},
    {field:'description', title:'說明', align:'left', width:200, visible:true}
  ],
  classes:'table',
  
  data : getRandomData(),//所有資料
  
  
  /*
  url: '../data/login_info2.json', 
  method: "get",                     //使用get请求到服务器获取数据
  dataType: "json",
  contentType: 'application/json,charset=utf-8',
  */
  
  
  
  
  
  uniqueId:'id', //哪一個欄位是key
  sortName:'name', //依照那個欄位排序			
  height : 550,
  pagination : true, //使否要分頁

  //可於ToolBar上顯示的按鈕
  showColumns : true, //顯示/隱藏哪些欄位
  showToggle : true, //名片式/table式切換
  showPaginationSwitch : true, //分頁/不分頁切換
  showRefresh : true, //重新整理
  search : true, //查詢

  onPageChange:function(currentPage, pageSize) {
    console.log("目前頁數:"+currentPage+",一頁顯示:"+pageSize+"筆");
  },
  pageSize : 10, //一頁顯示幾筆
  pageList : [ 10, 20, 50, 100], //一頁顯示幾筆的選項

  formatRecordsPerPage:function(pageSize) {
    return '&nbsp;&nbsp;每頁顯示' + pageSize + '筆';
  },
  formatShowingRows:function(fromIndex, toIndex, totalSize) {
    //目前第幾頁
    var currentPage = Math.ceil(fromIndex / this.pageSize);
    //總共幾頁
    var totalPageCount = Math.ceil(totalSize / this.pageSize);
    return '第'+currentPage+'頁&nbsp;&nbsp;共'+totalPageCount+'頁';
  }	
});

function getRandomData() {
  var data = [];
  
   
  
  
  
  
  for (var i = 0; i < 12000; i++) {
    data.push({
      id: "ID_"+i,
      name: 'Name_' + i,
      mailAddress : "ID_"+i+"@ooooo.com",
      description : "" 
    });
  }
  
  
  
  return data;
}
</script>


</body>
</html>








<%
    }
%>
