function statusChangeCallback(response) {
	console.log('statusChangeCallback');
    console.log(response);
    if (response.status === 'connected') {
    	// Logged into app and Facebook.
      	window.location.replace('./fbapp/login-callback.php');
    } else if (response.status === 'not_authorized') {
      	// The person is logged into Facebook, but the app.
    } else {
      	// The person is not logged into Facebook.
    }
}

function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
}

window.fbAsyncInit = function() {
	FB.init({
	appId      : '1585907511700956',
	cookie     : true,  // enable cookies to allow the server to access the session
	xfbml      : true,  // parse social plugins on this page
	version    : 'v2.6' // use any version
});
	
};

// Load the SDK asynchronously
(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) return;
	js = d.createElement(s); js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6&appId=1585907511700956";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));