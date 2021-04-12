# OAuth 2.0 Deconstructed

## Workshop description

<https://railsconf.com/program/workshops>

OAuth is an authorization standard that is both powerful and daunting to learn. Higher level libraries like OmniAuth can ease the process of implementing OAuth, but it can be difficult to debug or customize the code without first understanding OAuth at a lower level.

This workshop breaks down the OAuth standard from the very basic principles, covering the terminology in an easy to digest fashion. It goes over step-by-step code examples to implement OAuth from scratch for several providers, so you get the repetition necessary to work with OAuth on your own at any level of abstraction.

## Prerequisites

This workshop assumes you have at least a beginner's knowledge of the Ruby programming language, as well as some basic experience with a web framework like Ruby on Rails. We'll be using the [Sinatra](https://github.com/sinatra/sinatra) library for most code examples, as it gets out of the way to help make the OAuth concepts as clear as possible. If you haven't used Sinatra before but are familiar with other web frameworks like Ruby on Rails or Express.js, you will be able to follow along without any issue.

## Getting started

This workshop will build all code examples from scratch using the [Sinatra](https://github.com/sinatra/sinatra) library:

```bash
gem install sinatra
```

Web requests to third party APIs will be done using the [http.rb](https://github.com/httprb/http) library:

```bash
gem install http
```

We will be making OAuth requests to [GitHub](https://github.com/join), [Spotify](https://www.spotify.com/us/signup/), and [Google](https://accounts.google.com/signin/v2/identifier), so you should create an account for each.

### Optional

You can also register an OAuth application in each service to get developer credentials in advance. We'll go over the process of registering OAuth applications during the workshop in case you have any issues.

- [GitHub OAuth registration](https://docs.github.com/en/developers/apps/creating-an-oauth-app)
- [Spotify OAuth credentials](https://developer.spotify.com/documentation/general/guides/app-settings/#register-your-app)
- [Google OAuth credentials](https://support.google.com/cloud/answer/6158849?hl=en)

### Additional resources

Presentation slides:

- https://docs.google.com/presentation/d/112lfBlMSw83DyXUGq_PvCyTyzhMhi17T_Kji6_45ssE

Video course tutorial

- [OAuth 2.0 Deconstructed](https://actualize.teachable.com/p/oauth2-deconstructed/?product_id=2092020&coupon_code=RAILSCONF2021)

- (the workshop was based on this course)

- (the link above has a 50% coupon code for RailsConf attendees)

OAuth security considerations:

- https://portswigger.net/research/hidden-oauth-attack-vectors

- https://portswigger.net/web-security/oauth

- http://sakurity.com/oauth

OAuth for mobile:

- https://www.oauth.com/oauth2-servers/pkce/

OAuth 2.0 specification

- https://tools.ietf.org/html/rfc6749
