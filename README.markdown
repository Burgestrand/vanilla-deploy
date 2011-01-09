I’ve been meaning to write a deployment solution…
=================================================
I just never got around to it until now. This is a full, yet light and simple,
deployment solution. It uses [Ruby](http://ruby-lang.com/), as it’s a collection
of rake tasks and gems.

At the bare minimum, you need Ruby, RubyGems and Bundler installed. If you
don’t, I suggest you install Ruby using [RVM](http://rvm.beginrescueend.com/)
and then install Bundler using `gem install bundler`. This needs to be done on
both your production server (the one you deploy to) and your local computer (the
one you deploy from).

From that point and on, the process is simple
---------------------------------------------
1. Install dependencies: `bundle install`
2. Configure the settings in `config/` directory
3. Setup your deploy server using Vlad with `rake vlad:setup`
4. Push your code to the deploy server with Vlad: `rake vlad:update`

After these four steps, the entire preparation is finished. Each time you want
to deploy your code you simply commit it, push it to the remote repository (configured in `config/deploy.rb`) and then issue `rake vlad:deploy`.

By default:

1. You put [CoffeeScripts](http://jashkenas.github.com/coffee-script/) in `assets/javascripts` with extension `.coffee`
2. You put [SASS Stylesheets](http://sass-lang.com/) in `assets/stylesheets` with extension `.scss`
3. You alter the maintenance page in `public/maintenance.html`

Want documentation?
-------------------
This is just a mix of different gems in perfect harmony in the land where
nothing goes wrong and unicorns roam the street. However, for all questions
related to functionality, check each pieces’ documentation:

- [Jammit](http://documentcloud.github.com/jammit/) (asset packager)
- [Compass](http://compass-style.org/) (sass framework)
- [Barista](https://github.com/Sutto/barista) (coffeescript compiler interface)
- [Vlad the Deployer](http://rubyhitsquad.com/Vlad_the_Deployer.html) (deploy system)