#!/usr/bin/env sh

dir=$(dirname $0)

pack build dsosedovpvtl/appone \
    --path $dir/../appone \
    --env BP_JVM_VERSION=17 \
    --builder paketobuildpacks/builder-jammy-full \
    --publish | tee build_output.txt

sha=$(cat build_output.txt | grep 'Images' | cut -c 13-83)

sed -i '' "s/@sha256\:.*/@$sha/g" $dir/../appone-deploy/rancher/deployment.yaml
sed -i '' "s/@sha256\:.*/@$sha/g" $dir/../appone-deploy/tap/kservice.yaml

git add $dir/../appone-deploy/rancher/deployment.yaml
git add $dir/../appone-deploy/tap/kservice.yaml
git commit -S -m "Upgrade image"
git push origin HEAD

rm build_output.txt
