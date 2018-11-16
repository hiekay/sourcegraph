yarn build
mkdir -p build/web-ext
yarn web-ext sign -s build/firefox -a build/web-ext --api-key $FIREFOX_AMO_ISSUER --api-secret $FIREFOX_AMO_SECRET
# Copy over as exact generated file name
gsutil cp build/web-ext/*.xpi gs://sourcegraph-for-firefox/
# Overwrite latest
gsutil cp build/web-ext/$(ls build/web-ext) gs://sourcegraph-for-firefox/latest.xpi
