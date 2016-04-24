spawn = require('child_process').spawn

module.exports = (robot) ->

  #robot.hear /badger/i, (res) ->
    #res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"
  robot.respond /ping all/i, (res) ->
    #build = spawn '/bin/bash', ['test.sh']
    build = spawn 'ansible', ['all','-m','ping']
    build.stdout.on 'data', (data) -> res.send data.toString()
    build.stderr.on 'data', (data) -> res.send data.toString()
# heroku ps:restart --app metabot-slackbot
  robot.respond /wake meta(.*)/i, (res)->
    build = spawn 'heroku', ["ps:restart", "--app", "metabot-slackbot"]
    build.stdout.on 'data', (data) -> res.send data.toString()
    build.stderr.on 'data', (data) -> res.send data.toString()
