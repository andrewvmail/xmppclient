```
brew install websocat
websocat -t ws-l:127.0.0.1:8080 broadcast:mirror:
```


```
# using chrome
var webSocket = new WebSocket('ws://localhost:8080');
webSocket.onmessage = function(data) { console.log(data); }
```

- [ ] persistence across restarts
- [ ] connect to an ejabberd server
- [ ] try swiftui
 