# Gittop

The program will take a comma-separated list of Github usernames from standard input and using GitHub API prints user rating by all commits since 1 year.

## Installation

In program/gem folder

    $ bundle

[Generate](https://github.com/settings/tokens) your own github access token.

And put it in config:
`config/github_credentials.yml`

## Usage

And then execute:

    $ bin/gittop

Result:

![Result](https://dl.dropboxusercontent.com/u/2759137/gittop.png "Result screenshot")

## Contributing

1. Fork it ( https://github.com/salf/gittop/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
