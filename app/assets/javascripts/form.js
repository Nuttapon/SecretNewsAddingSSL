  	$(document).ready(function(){
    	var validator = $("#new_hotnews").validate({
    		success: function(label) {
                label.addClass("valid").text("สามารถใช้ได้.")},
    		rules: {
    			"hotnews[title]": {required: true, minlength: 10},
    			"hotnews[file]": {required: true, accept: "pdf"}
    		},
    		messages: {
    			"hotnews[title]": {
            required: "หัวข้อข่าวไม่สามารถเว้นว่างได้.",
            minlength: "อย่างน้อย {0} ตัวอักษร."},
          "hotnews[file]": { required: "ไฟล์ไม่สามารถว่างได้.", accept: "เฉพาะไฟล์ pdf เท่านั้น." }
    		}
    	});
    	var validator = $("#new_hotnews_edit").validate({
    		success: function(label) {
                label.addClass("valid").text("สามารถใช้ได้.")},
    		rules: {
    			"hotnews[title]": {required: true, minlength: 10},
    			"hotnews[file]": { accept: "pdf" }
    		},
    		messages: {
    			"hotnews[title]": {
            required: "หัวข้อข่าวไม่สามารถเว้นว่างได้.",
            minlength: "ต้องระบุอย่างน้อย {0} ตัวอักษร."},
          	"hotnews[file]": { accept: "File pdf only." }
    		}
    	});
    	var validator = $("#signup_user").validate({
    		success: function(label) {
                label.addClass("valid").text("สามารถใช้ได้.")},
    		rules: {
    			"user[fullname]": {required: true },
    			"user[email]": { required: true, email: true, remote:"/users/check_email"},
    			"user[password]": {required: true, minlength: 6 },
    			"user[password_confirmation]": { equalTo: "#input_password" }
    		},
    		messages: {
    			"user[fullname]": { required: "ขื่อและนามสกุล ไม่สามารถเว้นว่างได้." },
          		"user[email]": { required: "อีเมล์ไม่สามารถใช้งานได.้", remote: jQuery.format("{0} ถูกใช้งานไปแล้ว."), email: "รูปแบบของอีเมล์ไม่ถูกต้อง." },
          		"user[password]": {required: "รหัสผ่านไม่สามารถเว้นว่างได.้" , minlength: "ต้องระบุอย่างน้อย {0} ตัวอักษร."},
          		"user[password_confirmation]": { required: "รหัสผ่านยืนยันไม่สามารถเว้นว่างได้.", equalTo: "รหัสผ่านไม่สอดคล้องกัน."}
    		}
    	});
    	var validator = $("#signup_user_edit").validate({
    		success: function(label) {
                label.addClass("valid").text("สามารถใช้ได้.")},
    		rules: {
    			"user[fullname]": {required: true },
    			// "user[email]": { required: true, email: true, remote:"/users/check_email"},
    			"user[password]": { minlength: 6 },
    			"user[password_confirmation]": { equalTo: "#input_password" }
    		},
    		messages: {
    			"user[fullname]": { required: "ขื่อและนามสกุล ไม่สามารถเว้นว่างได้." },
          		// "user[email]": { required: "Please enter a  valid email address.", remote: jQuery.format("{0} is already in use.") },
          		"user[password]": { minlength: "ต้องระบุอย่างน้อย {0} ตัวอักษร."},
          		"user[password_confirmation]": { required: "รหัสผ่านยืนยันไม่สามารถเว้นว่างได้.", equalTo: "รหัสผ่านไม่สอดคล้องกัน."}
    		}
    	});
    	var validator = $("#new_organization").validate({
    		success: function(label) {
                label.addClass("valid").text("สามารถใช้ได้.")},
    		rules: {
    			"organization[name]": {required: true },
    			"organization[logo]": {required: true, accept: "jpg|jpeg|png" }
    		},
    		messages: {
    			"organization[name]": { required: "ชื่อไม่สามารถเว้นว่างได.้" },
          		"organization[logo]": { required: "โลโก้ไม่ว่างเว้นว่างได้.", accept: "เฉพาะไฟล์ JPG,JPEG,PNG เท่านั้น." }
    		}
    	});
    	var validator = $("#new_organization_edit").validate({
    		success: function(label) {
                label.addClass("valid").text("สามารถใช้ได้.")},
    		rules: {
    			"organization[name]": {required: true },
    			"organization[logo]": {accept: "jpg|jpeg|png" }
    		},
    		messages: {
    			"organization[name]": { required: "ชื่อไม่สามารถเว้นว่างได.้" },
                "organization[logo]": { required: "โลโก้ไม่ว่างเว้นว่างได้.", accept: "เฉพาะไฟล์ JPG,JPEG,PNG เท่านั้น." }
    		}
    	});
    	var validator = $("#new_news").validate({
    		success: function(label) {
                label.addClass("valid").text("สามารถใช้ได้.")},
    		rules: {
    			"news[title]": {required: true, minlength: 10 },
    			"news[detail]": {required: true },
    			"news[##]": {required: true}
    		},
    		messages: {
    			"news[title]": { required: "หัวข้อข่าวไม่สามารถว่างได้.",minlength: "อย่างน้อย {0} ตัวอักษร." },
          		"news[detail]": { required: "รายละเอียดข่าวไม่สามารถว่างได้." },
          		"news[##]": {required: "กรุณากรอกจังหวัด"}
    		}
    	});
    	var validator = $("#new_news_edit").validate({
    		success: function(label) {
                label.addClass("valid").text("สามารถใช้ได้.")},
    		rules: {
    			"news[title]": {required: true },
    			"news[detail]": {required: true },
    			"news[##]": {required: true}
    		},
    		messages: {
    			"news[title]": { required: "หัวข้อข่าวไม่สามารถเว้นว่างได้.",minlength: "อย่างน้อย {0} ตัวอักษร." },
                "news[detail]": { required: "รายละเอียดข่าวไม่สามารถเว้นว่างได้." },
                "news[##]": {required: "กรุณากรอกจังหวัด"}
    		}
    	});

  });