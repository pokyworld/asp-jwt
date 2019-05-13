// Login to Facebook
const fbLogin = () => {

    const fbAuth = {
        apiVersion: "v3.3",
        appId: "2414357575502006"
    };

    FB.init({
        appId: fbAuth.appId,
        autoLogAppEvents: true,
        xfbml: true,
        version: fbAuth.apiVersion
    });

    FB.getLoginStatus((res) => {
        // console.log("LoginStatus: ", res);
        if (!res.authResponse) {
            FB.login((res) => {
                if (res.authResponse) {
                    FB.getLoginStatus((res) => {
                        if (res.authResponse) console.log("Token : ", res.authResponse.accessToken);
                    });
                    FB.api('/me', (res) => {
                        console.log(`Login: Now logged in as: ${res.name}`);
                    });
                    getFbUserData();
                } else {
                    console.log('Login: User cancelled login or did not fully authorize.');
                }
            }, { scope: ['email'], location: 0 });
        } else {
            console.log("Token : ", res.authResponse.accessToken);
            getFbUserData();
        }
    });
};

// Get FB User Data
const getFbUserData = () => {
    FB.api('/me', { locale: 'en_US', fields: 'id,name,first_name,last_name,email,link,gender,location,picture' },
        (res) => {
            console.log(res);
            document.querySelector('#fbLoginText').innerHTML = 'Logout from  Facebook.';
            document.querySelector("#fbLoginButton").setAttribute("onclick", "fbLogout();")
            document.querySelector('#fbStatus').innerHTML = `Logged in as: ${res.name}`;

        }
    );
}

// Logout from facebook
const fbLogout = () => {
    const fbAuth = {
        apiVersion: "v3.3",
        appId: "2414357575502006"
    };

    FB.init({
        appId: fbAuth.appId,
        autoLogAppEvents: true,
        xfbml: true,
        version: fbAuth.apiVersion
    });

    FB.getLoginStatus((res) => {
        if (res.authResponse) {
            FB.logout(() => {
                document.querySelector('#fbLoginButton').setAttribute("onclick", "fbLogin()");
                document.querySelector('#fbLoginText').innerHTML = 'Login with Facebook.';
                document.querySelector('#fbStatus').innerHTML = `Logged out`;

            });
        }
    });
}