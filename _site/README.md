TRUG - Trójmiasto Ruby User Group
=================================

[![Join the chat at https://gitter.im/gotar/TRUG](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/gotar/TRUG?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Rodakase powered webpage of TRUG. Check on [http://trug.pl](http://trug.pl)

## Getting started
* Install (if you don't have them):
    * [Node.js](http://nodejs.org): `brew install node` on OS X
    * [Brunch](http://brunch.io): `npm install -g brunch`
    * [Bower](http://bower.io): `npm install -g bower`
    * Brunch plugins and Bower dependencies: `npm install & bower install`.
* Run:
    * `brunch watch --server` — watches the project with continuous rebuild. This will also launch HTTP server with [pushState](https://developer.mozilla.org/en-US/docs/Web/Guide/API/DOM/Manipulating_the_browser_history).
    * `brunch build --production` — builds minified project for production
* Learn:
    * `public/` dir is fully auto-generated and served by HTTP server.  Write your code in `app/` dir.
    * Place static files you want to be copied from `app/assets/` to `public/`.
    * [Brunch site](http://brunch.io), [Getting started guide](https://github.com/brunch/brunch-guide#readme)

How to run locally
---

1. Clone app repository:
   ```
   $ git clone git@github.com:gotar/TRUG
   ```

1. Change directory:
   ```
   $ cd TRUG
   ```

1. Install gems:
   ```
   $ bundle install
   ```

1. Copy and fill example `config/application.yml` and `.env` file:
   ```
   $ cp config/application.yml.example config/application.yml
   $ cp .env.example .env
   ```

1. Create PostgreSQL databases:
   ```
   trug_dev
   trug_test
   ```

1. Check if all tests pass:
   ```
   $ bundle exec rspec
   ```

1. Run backend apps:
   ```
   $ bundle exec rackup
   ```
