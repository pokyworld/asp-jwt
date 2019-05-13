<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon" href="favicon.ico" />

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

    <title>Login Page</title>
    <style>
        #fbLoginButton { margin: 1rem 0; padding: 0.2rem; text-align: left; width: 18rem; color: white; background-color: #4267b2; }
        .fa-facebook-f { float: left; margin: 0.4rem 1rem; }
    </style>
</head>
<body>
    <div class="container">
        <button id="fbLoginButton" type="button" class="btn btn-lg">
            <i class="fab fa-facebook-f"></i>&nbsp;<span id="fbLoginText">Login with Facebook</span>
        </button>
        <p id="fbStatus"></p>
        <p id="fbToken"></p>
    </div>

    <!--JQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

    <!-- Popper & Bootstrap-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <!-- Facebook SDK s-->
    <script async defer src="https://connect.facebook.net/en_US/sdk.js"></script>

    <script src="config/index.js"></script>
    <script src="scripts/fbLogin.js"></script>
    <script>
        var fbToken = "";
        var fbLoggedIn = false;

        if(window.addEventListener) {
            window.addEventListener('load', () => {
                document.querySelector('#fbLoginButton').addEventListener('click', () => {
                    if(!fbLoggedIn) { 
                        fbLogin();
                    } else {
                        fbLogout();
                    }
                }, false);
            }, false); //W3C
        } else {
            alert("This browser no longer supported");
        }
    </script>
</body>
</html>