# Web application as a GIT server

This is a demo implementation for git dumb protocol. With the app up and running, this command can be executed from a console:

```git clone http://localhost:3000/ hello-world```

A local git repo will be created with a single file in it.

## Code
This is a rails application. Git objects creation and git protocol endpoints handling is in [git_controller.rb](https://github.com/andrewromanenco/git-server-hello-world/blob/master/app/controllers/git_controller.rb)

## How it works
[Read it in my blog](http://romanenco.com/git-server-web-app/)

## License
The code is released under Apache License Version 2.0

## Contacts
andrew@romanenco.com<br/>
romanenco.com<br/>
https://twitter.com/andrewromanenco

