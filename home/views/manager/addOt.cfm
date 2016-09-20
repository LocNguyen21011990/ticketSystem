<cfoutput>
<article class="col-sm-12 col-md-12 col-lg-12">

	<div class="jarviswidget" id="wid-id-4" data-widget-editbutton="false" data-widget-custombutton="false">
		<header>
			<span class="widget-icon"> <i class="fa fa-edit"></i> </span>
			<h2>Add Overtime</h2>				
			
		</header>
		<div>
			<div class="jarviswidget-editbox">
				
			</div>
			<div class="widget-body no-padding">
				
				<form id="smart-form-register" class="smart-form" method="POST">
					<input type="hidden" value="0" name="userId" id="userId">
					<fieldset>
						<div class="row">
							<section class="col col-6">
								<label class="input"> <i class="icon-append fa fa-user"></i>
									<input type="text" name="name" id="nameUser" placeholder="Name">
									<b class="tooltip tooltip-bottom-right">Needed to enter the website</b> </label>
							</section>
							
						</div>

						<div class="row">
							<section class="col col-6">
								<label class="input"> <i class="icon-append fa fa-calendar"></i>
									<input type="text" name="mydate" placeholder="Select a date overtime" class="form-control datepicker" data-dateformat="dd/mm/yy">
									<b class="tooltip tooltip-bottom-right">Needed to enter the website</b> </label>
							</section>
						</div>

						<div class="row">
							<section class="col col-2">
								<label>From</label>
								<div class="input-group">
									<input class="form-control clockpicker" name="clockpickerF" type="text" placeholder="Select time" data-autoclose="true" style="text-align:center">
									<span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
								</div>
							</section>
							<section class="col col-2">
								<label>To</label>
								<div class="input-group">
									<input class="form-control clockpicker" name="clockpickerT" type="text" placeholder="Select time" data-autoclose="true" style="text-align:center">
									<span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
								</div>
							</section>
							<section class="col col-2">
								<label>Total Hours</label>
								<label class="input">
									<input type="text" name="overtimes" placeholder="Overtimes">
								</label>
							</section>
						</div>
						<div class="row">
							<section class="col col-6">
								<label class="textarea">
									<textarea rows="4" name="reason" placeholder="Reason"></textarea>
								</label>
							</section>
						</div>

					</fieldset>

					<footer>
						<button type="submit" class="btn btn-primary">
							Submit
						</button>
					</footer>
				</form>						
				
			</div>
			<!-- end widget content -->
			
		</div>
		<!-- end widget div -->
		
	</div>
	<!-- end widget -->						


</article>
<script type="text/javascript">
	$(document).ready(function(){	
		// Notification
		
			<cfif CGI.REQUEST_METHOD eq "POST">
				<cfif structKeyExists(rc,'stt')>
						$.smallBox({
							title : "Notification",
							content : "<i class='fa fa-clock-o'></i> <i>#rc.stt#.</i>",
							color : "##659265",
							iconSmall : "fa fa-check fa-2x fadeInRight animated",
							timeout : 4000
						});
				<cfelse>
						$.smallBox({
							title : "Notification",
							content : "<i class='fa fa-clock-o'></i> <i>OOP! Something wrong, Please Try again.</i>",
							color : "##C46A69",
							iconSmall : "fa fa-check fa-2x fadeInRight animated",
							timeout : 4000
						});
				</cfif>
			</cfif>

		// Autocomplete
		$("##nameUser").autocomplete({
				source:#rc.usersOffical#,
				selectFirst: true,
				autoFocus: true,
				minLength : 0,
				select:function(event,ui){
			     	$('##userId').val(ui.item.id );
				}
		});
		/*
		 * CLOCKPICKER
		 */
		
		$('.clockpicker').clockpicker({
			placement: 'top',
		    donetext: 'Done'
		});

		var $registerForm = $("##smart-form-register").validate({
	
				// Rules for form validation
				rules : {
					name : {
						required : true
					},
					clockpickerF : {
						required : true
					},
					mydate : {
						required : true
					},
					clockpickerT : {
						required : true
					},
					overtimes : {
						required : true
					}
				},
	
				// Messages for form validation
				messages : {
					name : {
						required : 'Please select name of employer'
					},
					clockpickerF : {
						required : 'Please enter from hours'
					},
					mydate : {
						required : 'Please choose date'
					},
					clockpickerT : {
						required : 'Please enter to hours'
					},
					overtimes : {
						required : 'Please enter overtimes'
					}
				},
				// Do not change code below
				errorPlacement : function(error, element) {
					error.insertAfter(element.parent());
				}
			});
	})
</script>
</cfoutput>