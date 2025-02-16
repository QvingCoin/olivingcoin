#!/usr/bin/env bash
#
# Copyright (c) 2018 The Olivingcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C

if [ "$TRAVIS_EVENT_TYPE" = "pull_request" ]; then
  test/lint/commit-script-check.sh $TRAVIS_COMMIT_RANGE
fi

test/lint/git-subtree-check.sh src/crypto/ctaes
test/lint/git-subtree-check.sh src/secp256k1
test/lint/git-subtree-check.sh src/univalue
test/lint/git-subtree-check.sh src/leveldb
test/lint/check-doc.py
test/lint/check-rpc-mappings.py .
test/lint/lint-all.sh

if [ "$TRAVIS_REPO_SLUG" = "olivingcoin/olivingcoin" -a "$TRAVIS_EVENT_TYPE" = "cron" ]; then
    git log --merges --before="2 days ago" -1 --format='%H' > ./contrib/verify-commits/trusted-sha512-root-commit
    while read -r LINE; do travis_retry gpg --keyserver hkp://subset.pool.sks-keyservers.net --recv-keys $LINE; done < contrib/verify-commits/trusted-keys &&
    travis_wait 50 contrib/verify-commits/verify-commits.py --clean-merge=2;
fi
