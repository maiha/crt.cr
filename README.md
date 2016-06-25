# crt.cr [![Build Status](https://travis-ci.org/maiha/crt.cr.svg?branch=travis)](https://travis-ci.org/maiha/crt.cr)

Bindings for libncursesw and crt class

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  crt:
    github: maiha/crt.cr
```


## Usage


```crystal
require "crt"

win = Crt::Window.new(24, 80)
win.clear
win.print(5, 10, "hello world")
win.refresh
Crt.done
```


## Development

- for ubuntu

```shell
apt-get install libncursesw5-dev
```

## Contributing

1. Fork it ( https://github.com/maiha/crt.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [maiha](https://github.com/maiha) maiha - creator, maintainer
