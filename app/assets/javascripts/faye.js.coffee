jQuery ->
  faye = new Faye.Client('http://localhost:9292/faye')
  faye.subscribe("/chats/new")
