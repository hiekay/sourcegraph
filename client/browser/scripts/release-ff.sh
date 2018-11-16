# Setup
yarn build
rm -rf build/web-ext
mkdir -p build/web-ext

# Sign the bundle
yarn web-ext sign -s build/firefox -a build/web-ext --api-key $FIREFOX_AMO_ISSUER --api-secret $FIREFOX_AMO_SECRET

# Upload to gcp
for filename in $(ls build/web-ext); do
    gsutil cp build/web-ext/$filename gs://sourcegraph-for-firefox/$filename
    gsutil cp build/web-ext/$filename gs://sourcegraph-for-firefox/latest.xpi
done
