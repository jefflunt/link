open source URL shortener

Available as a <a href="https://link.jefflunt.com">demo website</a>.

Also try the API:

```
POST https://link.jefflunt.com/api/create
     https://link.jefflunt.com/api/create?destination=https://google.com
     params:
       destination: a full URL destination, e.g. https://google.com

     returns:
        http 200: if the destination input is valid, with the shorted link. e.g.:
            {
                "code": "DJCzTYBu",
                "url": "http://localhost:3003/DJCzTYBu",
                "destination": "https://google.com",
                "qr_code": "<... raw SVG tag, can be embedded into a webpage ...>",
            }

        http 422: if the destination input is invalid, or less than 10 characters
            {
                "error": "failed to create link; check params and try again"
            }


GET  https://link.jefflunt.com/api/expand/<code>
     https://link.jefflunt.com/api/expand/44K38pKG
    params:
        code: the alphanumeric code you got from the api/create endpoint

    returns:
        http 200: if the code is found, e.g.:
            {
                "code": "44K38pKG",
                "url": "https://link.jefflunt.com/44K38pKG",
                "destination": "https://google.com"
            }

        http 404: if the code is not found, e.g.:
            {
                "error": "url not found by code"
            }
```

