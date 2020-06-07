# Link Shortener

Screenshots:
[![screenshot.png](https://i.postimg.cc/65pLFTvT/screenshot.png)](https://postimg.cc/qgW33JQd)

# Development

## Initial Setup

```
$ bundle install
$ yarn
$ rails db:setup
```
## Optional Setup For System Tests

Make sure you have [Chrome](https://www.google.com/chrome/index.html) installed. Then run the following:

```
$ brew cask install chromedriver
```

## Local Build

```
$ foreman start
```

# Tests

```
$ rails t
```

# System Tests

```
$ rails test:system
```
