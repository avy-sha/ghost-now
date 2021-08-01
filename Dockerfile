FROM ghost:4-alpine

WORKDIR /var/lib/ghost

RUN npm install ghost-storage-adapter-s3 \
    && mkdir -p ./content.orig/adapters/storage \
    && cp -vr ./node_modules/ghost-storage-adapter-s3 ./content.orig/adapters/storage/s3