#!/usr/bin/env bash
# setting the locale, some users have issues with different locales, this forces the correct one
export LC_ALL=en_US.UTF-8

fahrenheit=$1
location=$2
fixedlocation=$3

display_location()
{
  if $location && [[ ! -z "$fixedlocation" ]]; then
    echo " $fixedlocation"
  elif $location; then
    city=$(curl -s https://ipinfo.io/city 2> /dev/null)
    region=$(curl -s https://ipinfo.io/region 2> /dev/null)
    echo " $city, $region"
  else
    echo ''
  fi
}

fetch_weather_information()
{
  display_weather=$1
  # it gets the weather condition textual name (%C), and the temperature (%t)
  curl -sL wttr.in/$fixedlocation\?format="%C+%t$display_weather"
}

#get weather display
display_weather()
{
  wer -i
}

main()
{
  # process should be cancelled when session is killed
  echo "$(display_weather)"
}

#run main driver program
main
