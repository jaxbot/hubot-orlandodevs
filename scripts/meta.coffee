# Description:
#   Info about this particular bot
#
# Commands:
#   hubot about - Returns info about this particular bot
# Author:
#   jaxbot

module.exports = (robot) ->
  robot.respond /about/i, (msg) ->
    msg.send """
I am Eve, a hubot for the Orlando Developers Slack.
Hubot is GitHub's open source and powerful chat bot platform: https://hubot.github.com/
Eve is a robot from Wall-E, and is also short and easy to type. Pronounced E-vuh.
I am open source. Fork and improve me here: https://github.com/jaxbot/hubot-orlandodevs
I am run by @Jaxbot
    """

