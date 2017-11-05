# SETUP

```
bundle install
./bin/setup
rake db:migrate
```

# Run It

```
nf start -f Procfile.local # with node-foreman

heroku local -f Procfile.local # with Heroku CLI

# Without these, run two commands separately:
rails s -p 5000
mongod --dbpath=./tmp/data/
```

The app is now available on port 5000!
