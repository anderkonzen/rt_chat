# RT-Chat

[![Build Status](https://travis-ci.org/anderkonzen/rt_chat.svg?branch=master)](https://travis-ci.org/anderkonzen/rt_chat) [![Code Climate](https://codeclimate.com/github/anderkonzen/rt_chat/badges/gpa.svg)](https://codeclimate.com/github/anderkonzen/rt_chat) [![Test Coverage](https://codeclimate.com/github/anderkonzen/rt_chat/badges/coverage.svg)](https://codeclimate.com/github/anderkonzen/rt_chat/coverage)

This is an experiment with ActionCable, used to implement a real-time chat room. In a brief, some of the features:

* users can sign up / log in / log out from the app
* messages are in real-time
* users can choose between 3 different dialects when posting messages

This project was built with Rails 5, using ActionCable to deal with the pub/sub side of things.

The original requirements also included the ones below, but at the time of this writing they were not fully implemented:

* show a descriptive dialect icon for the messages
* list of active users

## Code Quality ##

I strongly believe that tests, a CI pipeline, issue tracking, code analysis, PRs, etc., are all important for a project. They protect the business rules and also the developers when changing or implementing features.

Thus, I tried to cover these points by using github merge requests, using travis.ci to have some kind of build pipeline, codeclimate for code analysis and test coverage, etc. I believe that all these small features add much more value to the project.

