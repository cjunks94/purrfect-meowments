  #! /bin/sh

# If database exists, migrate. Otherweise setup (create and migrate)
bundle exec rake db:migrate db:seed 2>/dev/null || bundle exec rake db:create db:migrate db:seed
echo "Done!"
