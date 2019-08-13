```
brew install websocat
websocat -t ws-l:127.0.0.1:8080 broadcast:mirror:
```


```
# using chrome
var webSocket = new WebSocket('ws://localhost:8080');
webSocket.onmessage = ({data}) => console.log(data);
```

```
# state debugger
open https://andrewvmail.github.io/react-json-inspector/
```

- [x] state debugger
- [ ] persistence across restarts
- [ ] connect to an ejabberd server
- [ ] try swiftui
 