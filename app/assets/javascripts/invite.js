FB.init({
    appId:'500853090012906',
    frictionlessRequests : true,
    cookie:true,
    status:true,
    xfbml:true
  });

  function FacebookInviteFriends() {
    FB.ui({
      method: 'apprequests',
      message: 'Log in with our app and check out your Facebook stats.'
    }, fbCallback);
}

function fbCallback(response) {
console.log(response);
}