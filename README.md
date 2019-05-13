# asp-jwt
# Author: Des Butler - 2019

Main URL: https://example.com

Service URL: https://api.example.com:8443/vb/login.asp (POST)

Sample Data JSON:

{
	"email": "john.doe@example.com",
	"password": null,
	"provider": "facebook",
	"token": "U7CgfnfMxez6uymFkyjN4PMdEsyg6PxqLVjnjbSRyS3Pa3DZ7uN5ku2v8x48PjGV65XwPz8Lac3axTCQh9mSpBHzNBRnAbzUqDtKgUU2bySWapbzVezmLJPZgZqzXLEQktbQGapJCNAfzD78JvEgsCkfJnLrqXkcDsSCSxtrzaUqt4CFUX99m5rBwppm7btzH7CAhm3U57yHH5NmVLdEZbdLHMBFx9sZsXwUvRdJ2jhB8faRVZCgtu5vxvpZ55gQ"
}

/main/config/index.js

const config = {
    facebook: {
        apiVersion: "{{API_VERSION}}",
        appId: "{{API_CLIENT_ID}}"
    }
}

/services/confog/keys

<% JWTkey = "{{256_BIT_KEY}}" %>
