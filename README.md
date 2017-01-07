# ChatSpace

* Sample https://chat-space-demo.herokuapp.com/
* (now under construction)

## Description
ChatSpace serves a browser-based chat, 
also is a part of <span style="color:#ca493c">TECH::CAMP _EXPERT_</span> curriculum.

## Features

* Online chatting w/ attached images
* User registration
* Timeline is automatically updated

## Environment /dev

* Ruby 2.3.1
* Rails 5.0.1

## Structure

### Tables

####Users

* has many **Groups**

* has many **Messages**

|columns     |types   |
|:----------:|:------:|
|_name*_     |string  |
|email       |string  |
|password*   |string  |

####Groups

* has many **Messages**

|columns     |types   |
|:----------:|:------:|
|group_name* |integer |

####Messages

* belong to **User**

* belong to **Group**

|columns   |types   |
|:--------:|:------:|
|body*     |text    |
|image     |string  |
|group_id* |integer |
|user_id*  |integer |

( * = not null, _Italics_ are indexed)
