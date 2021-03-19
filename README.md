# crt.cr [![Build Status](https://travis-ci.org/maiha/crt.cr.svg?branch=master)](https://travis-ci.org/maiha/crt.cr)

Bindings for libncursesw and crt class

- crystal: 0.27.2 0.31.1 0.32.1 0.33.0

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  crt:
    github: maiha/crt.cr
    version: 0.4.2
```

## Usage


```crystal
require "crt"

Crt.init

window = Crt::Window.new(5, 21)
window.print(2, 4, "Hello, world!")
window.refresh

sleep 10.seconds

Crt.done
```

See [./examples/](./examples/) for more usages.

## Supported C Functions

- see: https://github.com/maiha/crt.cr/blob/master/src/libncursesw.cr


## Development

- for ubuntu

```shell
apt-get install libncursesw5-dev
apt-get install libgpm-dev        # needs only for static link
```

## Contributing

1. Fork it ( https://github.com/maiha/crt.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [maiha](https://github.com/maiha) maiha - creator, maintainer
