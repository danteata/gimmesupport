jQuery ->
  faye = new Faye.Client('http://localhost:9292/faye')
  faye.subscribe("/communities/chat", (data) -> eval(data) )
