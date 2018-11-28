ng serve --port 4401

(You can change 4401 to whatever number you want)

Then launch browser -> http://localhost:4401/

Basically, I was having two Applications and with the help of the above approach now I am able to run both of them simultaneously in my development environment.

Instead you should specify ng serve --port 5000 in package.json like this:

```javascript
"scripts": {
    "start": "ng serve --port 5000"
}
```
