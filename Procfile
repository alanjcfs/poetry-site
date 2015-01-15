# Run Unicorn
#
# web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
#
# Run Puma
#
web: bundle exec puma -p ${PORT:-3000} -e ${RACK_ENV:-development} -w 2 -t 1:16
