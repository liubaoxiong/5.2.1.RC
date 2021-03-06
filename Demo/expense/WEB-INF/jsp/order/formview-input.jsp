<%@ page contentType="text/html;charset=UTF-8" import="java.util.*"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<title>报销单</title>
		<%@include file="/common/iframe-meta.jsp" %>	
		<script src="${resourcesCtx}/widgets/validation/validate-all-1.0.js" type="text/javascript"></script>
		<script src="${resourcesCtx}/widgets/validation/dynamic.validate.js" type="text/javascript"></script>
		<script type="text/javascript" src="${resourcesCtx}/js/staff-tree.js"></script>
		<script type="text/javascript" src="${resourcesCtx}/js/custom.tree.js" ></script>
		<script type="text/javascript" src="${ctx}/js/order.js" ></script>
		<script type="text/javascript">
			var pos="";
			function expenseReportFormValidate(){
				$("#expenseReportForm").validate({
					submitHandler: function() {
						$("#position").attr("value",pos);
						$(".opt_btn").find("button.btn").attr("disabled","disabled");
						var cansave = iMatrix.getSubTableDatas("expenseReportForm");
						if(cansave){
							aa.submit('expenseReportForm','','main',saveBack);
						}
					}
				});
			}

			function saveBack(){
				getContentHeight();
				showMsg();
			}
			function submitForm(url,position){
				pos=position;
				$('#expenseReportForm').attr('action',url);
				$('#expenseReportForm').submit();
			}
			function callback(){
				//addFormValidate('${fieldPermission}','expenseReportForm');
				expenseReportFormValidate();
				showMsg();
			}
			function selectPerson(){
				var acsSystemUrl = "${ctx}";
				popTree({ title :'选择人员',
					innerWidth:'400',
					treeType:'MAN_DEPARTMENT_TREE',
					defaultTreeValue:'id',
					leafPage:'false',
					multiple:'false',
					hiddenInputId:'customerLoginName',
					showInputId:'customer',
					acsSystemUrl:acsSystemUrl,
					callBack:function(){}});
			}
		</script>
	</head>
	
	<body onload="getContentHeight();">
		<div class="ui-layout-center">
		<div class="opt-body">
				<aa:zone name="main">
					<div class="opt-btn">
						<button class='btn' onclick="submitForm('${ctx}/order/save.htm','formview')"><span><span>保存</span></span></button>
					</div>
					<div id="opt-content" class="form-bg">
					<div style="display: none;" id="message"><s:actionmessage theme="mytheme" /></div>
						<form  id="expenseReportForm" name="expenseReportForm" method="post" action="">
							<input type="hidden" name="id" id="id" value="${id }"/>
							<input type="hidden" name="position" id="position"/>
							<grid:formView code="ES_ORDER_FORMVIEW" entity="${order}"></grid:formView>
						</form>
					</div>
					<script type="text/javascript">
						//流程环节设置的必填字段
						//addFormValidate('${fieldPermission}','expenseReportForm');
						expenseReportFormValidate();
					</script>
				</aa:zone>
			</div>
			</div>
	</body>
	<script type="text/javascript" src="${resourcesCtx}/widgets/colorbox/jquery.colorbox.js"></script>
	<script type="text/javascript" src="${resourcesCtx}/widgets/timepicker/timepicker-all-1.0.js"></script>
</html>