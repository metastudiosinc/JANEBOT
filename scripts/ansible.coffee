spawn = require('child_process').spawn

getRandomComment = () ->
  "Good morning sleepy heads."

getRandomName = ()->
  "action-jack"

module.exports = (robot) ->

  #robot.hear /badger/i, (res) ->
    #res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"
  robot.respond /ping all/i, (res) ->
    #build = spawn '/bin/bash', ['test.sh']
    build = spawn 'ansible', ['all','-m','ping']
    build.stdout.on 'data', (data) -> res.send data.toString()
    build.stderr.on 'data', (data) -> res.send data.toString()

# heroku ps:restart --app metabot-slackbot
  robot.hear /wake up(.*)/i, (res)->
    res.send getRandomComment()
    build = spawn 'heroku', ["ps:restart", "--app", "metabot-slackbot"]
    build.stdout.on 'data', (data) -> res.send data.toString()
    build.stderr.on 'data', (data) -> res.send data.toString()

# digital ocean start a small server
  robot.hear /(.*)need a small server(.*)/i, (res)->
    res.send "I will see what is lying around."
    build = spawn 'tugboat', ["create", getRandomName()]
    build.stdout.on 'data', (data) -> res.send data.toString()
    build.stderr.on 'data', (data) -> res.send data.toString()
