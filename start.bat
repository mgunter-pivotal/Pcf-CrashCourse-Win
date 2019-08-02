
rem Domain
set DOMAIN="cfapps.io"

echo " =====> Using domain:" %DOMAIN%

echo "=====> mvnw package"
call mvn package

echo "=====> cf push -f attendee/manifest.yml"
cf push -f attendee\manifest.yml

echo "=====> cf cups pcf101-demo-attendee-service -p uri https://pcf101-demo-attendee.${DOMAIN}/attendees"
cf cups pcf101-demo-attendee-service -p "{\"uri\":\"https://pcf101-demo-attendee.%DOMAIN%/attendees\"}"

rem cf push -f articulate/manifest.yml
cf push -f articulate\manifest-with-service.yml

rem echo "=====> cf cups pcf101-demo-attendee-service -p uri https://pcf101-demo-attendee.${DOMAIN}/attendees"
rem cf cups pcf101-demo-attendee-service -p "{\"uri\":\"https://pcf101-demo-attendee.${DOMAIN}/attendees\"}"

rem echo "=====> cf cf bind-service pcf101-demo-articulate pcf101-demo-attendee-service"
rem cf bind-service pcf101-demo-articulate pcf101-demo-attendee-service

rem echo "=====> cf restage pcf101-demo-articulate"
rem cf restage pcf101-demo-articulate

explorer https://pcf101-demo-articulate.%DOMAIN%