# Salt-kitchen documentation

Here you can find the first steps to make a test with `kitchen-salt`.

## First steps

### Installation

- Install `ruby`. You can read the following link to find some different installation ways: <https://github.com/saltstack/kitchen-salt/blob/master/docs/gettingstarted.md#installing-ruby>.
- `gem install bundler`.
- Create a file called `Gemfile` with:

  ```shell
    # Gemfile

    source '<https://rubygems.org>'

    gem 'kitchen-salt'
    gem 'kitchen-docker'
    gem 'kitchen-sync'
  ```

- `bundle install`:

### Configuration

The main file is `.kitchen.yml` and you have to add to your project. You can find a complete example [here](https://github.com/thiccbois/salt-formula-cookiecutter/%7B%7Bcookiecutter.formula%7D%7D/.kitchen.yml).

Finally you have your formula ready for testing.

You can launch each command from following list one per one:

```shell
bundle exec kitchen list
bundle exec kitchen create
bundle exec kitchen converge
bundle exec kitchen verify
bundle exec kitchen destroy
```

or you can launch this which is a grouping of the above:

```shell
bundle exec kitchen test
```
