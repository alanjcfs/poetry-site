# Run Unicorn
#
# web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
#
# Run Puma
#
web: bundle exec puma -p ${PORT:-3000} -e ${RACK_ENV:-development} -w ${PUMA_WORKERS:-3} -t ${PUMA_MIN_THREADS:-1}:${PUMA_MAX_THREADS:-16}
