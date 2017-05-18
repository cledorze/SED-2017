# Copyright 2016 The Kubernetes Authors.
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

FROM suse/sles12sp1
ADD http://suse-manager-1.zypp.fr/pub/RHN-ORG-TRUSTED-SSL-CERT /etc/pki/trust/anchors/smt.crt
RUN zypper ar http://suse-manager-1.zypp.fr/ks/dist/sles12sp1-basic SLE12SP1-BASIC
#RUN zypper ar http://suse-manager-1.zypp.fr/ks/dist/child/sle-module-web-scripting12-pool-x86_64-sp1/sles12sp1-basic SLE12SP1-WSP
#RUN zypper ar http://suse-manager-1.zypp.fr/ks/dist/child/sle-module-web-scripting12-updates-x86_64-sp1/sles12sp1-basic SLE12SP1-WSU
RUN update-ca-certificates
RUN zypper ref -s
#RUN zypper lr
#RUN zypper --non-interactive in apache2 php7
zypper --non-interactive in apache2
# If the container's stdio is connected to systemd-journald,
# /proc/self/fd/{1,2} are Unix sockets and apache will not be able to open()
# them. Use "cat" to write directly to the already opened fds without opening
# them again.
#RUN sed -i 's#ErrorLog /proc/self/fd/2#ErrorLog "|$/bin/cat 1>\&2"#' /etc/apache2/apache2.conf
#RUN sed -i 's#CustomLog /proc/self/fd/1 combined#CustomLog "|/bin/cat" combined#' /etc/apache2/apache2.conf

ADD ./frontend/guestbook.php /var/www/html/guestbook.php
ADD ./frontend/controller.js /var/www/html/controllers.js
ADD ./frontend/index.html /var/www/html/index.html
