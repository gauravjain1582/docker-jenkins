docker service create --name jenkins-master \
-p 50000:50000 \
-p 8880:8080 \
--mount source=jenkins_master_volume,target=/var/jenkins_home \
-l traefik.enable=true \
-l traefik.frontend.passHostHeader=true \
-l traefik.frontend.rule="Host:jenkins.vlekh.net,http://jenkins.vlekh.net" \
-l traefik.backend=jenkins-master \
-l traefik.docker.network=traefik \
-l traefik.entryPoint=https \
-l traefik.port=8080 \
--replicas 1 \
--network traefik \
--update-delay 10s \
--constraint 'node.hostname == worker01' \
jenkins/jenkins:lts
