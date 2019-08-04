# Test App - a simple Go webapp

### Pushing the app to Cloud Foundry

```
cf push
```

### Endpoints

`/`: a simple landing page displaying the index and uptime
`/env`: displays environment variables
`/exit`: instructs the app to exit with status code 1
`/port`: returns the local port the request was received on

### Configure the app to listen on multiple ports

By providing a customer start command, you can configure the app to listen on multiple ports. The app responds the same way to each port.
```
cf push test-app -c "test-app --ports=7777,8888"
```
