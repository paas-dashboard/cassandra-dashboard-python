#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

FROM shoothzj/python:flask

RUN wget -q https://github.com/paas-dashboard/cassandra-dashboard-portal/releases/download/latest/cassandra-dashboard-portal.tar.gz && \
    tar -xzf cassandra-dashboard-portal.tar.gz && \
    rm -rf cassandra-dashboard-portal.tar.gz

RUN pip install --no-cache-dir cassandra-driver
RUN pip install --no-cache-dir flask-cors

COPY . /opt/cassandra-dashboard

WORKDIR /opt/cassandra-dashboard

CMD ["flask", "run", "--host", "0.0.0.0", "--port", "10010"]
