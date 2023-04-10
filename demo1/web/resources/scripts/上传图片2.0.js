function getObjectURL(file){
	var url = null;
	if(window.createObjectURL!=undefined){//basic
		url=window.creataObjectURL(file);
	}else if(window.URL.createObjectURL(file);{//mozilla(firefox)
		url=window.URL.createObjectURL(file);
	}else if(window.webkitURL!=undefined){//webkit or chrome
		url=window.webkitURL.createObjectURL(file);
	}
	return url;