#!/bin/bash
# Copyright 2017 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -ex

cd "$(dirname "$0")/../../.."

cd "third_party/abseil-cpp/cmake/build"
xargs rm < install_manifest.txt
cd ../../../..

# Install c-ares
# If the distribution provides a new-enough version of c-ares,
# this section can be replaced with:
# apt-get install -y libc-ares-dev
cd "third_party/cares/cares/cmake/build"
xargs rm < install_manifest.txt
cd ../../../../..


# Install zlib
cd "third_party/zlib/cmake/build"
xargs rm < install_manifest.txt
cd ../../../..

# Install protobuf
cd "third_party/protobuf/cmake/build"
xargs rm < install_manifest.txt
cd ../../../..


# Just before installing gRPC, wipe out contents of all the submodules to simulate
# a standalone build from an archive
# shellcheck disable=SC2016
#git submodule foreach 'cd $toplevel; rm -rf $name'

# Install gRPC
cd "cmake/build"
xargs rm < install_manifest.txt
cd ../..

# Build helloworld example using cmake
cd "examples/cpp/helloworld/cmake/build"
xargs rm < install_manifest.txt
cd ../..
