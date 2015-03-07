# Description:
#   Experimental plugin to scrap local Orlando meetup events
#   Dunno if it'll stick around, but interesting idea nonetheless
#   Only supports Cloudspace meetups right now, but should support
#   Orlando tech meetups in general in the future
#
# Commands:
#   hubot university meetups - Returns upcoming Cloudspace meetups
#
# Author:
#   jaxbot

http = require 'http'

getUniversityMeetups = (callback) ->
  http.get 'http://www.universitytechmeetups.com', (res) ->
    resp = ""
    res.on 'data', (data) ->
      resp += data.toString()
    res.on 'end', ->
      events = resp.split "class='upcoming"
      events.shift()
      results = ""
      for event in events
        title = event.split "<h3>"
        title = title[1].split "<"
        title = title[0]

        name = event.split "<strong>"
        name = name[1].split "<"
        name = name[0]

        time = event.split "<p>"
        time = time[2].split "<"
        time = time[0]

        results += title + ": " + name + " (" + time + ")\n"
      callback(results)

module.exports = (robot) ->
  robot.respond /university meetups/gi, (msg) ->
    getUniversityMeetups (results) ->
      msg.reply results
