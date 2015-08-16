FlowRouter.route '/', {
  triggersEnter: [
    (context, redirect) ->
      redirect '/admin'
  ]
}