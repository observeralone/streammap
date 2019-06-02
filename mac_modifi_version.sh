#!/usr/bin/env bash
# ----------------------------------------------------------------------------
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
# ----------------------------------------------------------------------------
version=$1
type=$2
if [[ "$version" == "" || "$type" == "" ]]
then
    echo "please input mac_modifi_version.sh \${version} \${ r(release) or s(SNAPSHOT) } "
    exit 1
fi
if [[ "$type" != "r" && "$type" != "s" ]]
then
    echo "please input mac_modifi_version.sh \${version} \${ r(release) or s(SNAPSHOT) } "
    exit 1
fi
new_version=$version
if [[ "$type" == "s" ]]
then
   new_version=$new_version-"SNAPSHOT"
fi
mvn versions:set -DnewVersion=$new_version
