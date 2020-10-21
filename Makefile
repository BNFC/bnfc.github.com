default :
	bundle exec jekyll serve

# On Mac, this might not work due to permission problems:
install-bundler:
	gem install jekyll bundler

# This worked for me (Andreas, 2020-10-21).
update-bundler :
	bundle update --bundler


# EOF
