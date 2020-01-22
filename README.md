# Checklists_and_audits

### Setup

App requires [Ruby](https://www.ruby-lang.org/en/) v2.6.3 to run.

Install the dependencies and start the server.

```sh
$ git git@github.com:SidiromUA/checklists_and_audits.git
$ cd checklists_and_audits
$ rvm use ruby-2.6.3
# If you do not have installed this version of ruby please install it.
$ rvm install 2.6.3 # or $ rvm install ruby-2.6.3
$ bundle
```

```sh
$ rails db:setup
```

```sh
$ rails s
```