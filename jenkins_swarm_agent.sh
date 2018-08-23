# generate secrate
# echo "-master http://jenkins-master-ip:8880 -password <jenkins-password> -username <jenkins-user>" | docker secret create jenkins-v3 -

docker service create \
        --name jenkins-swarm-agent \
	--mode global \
        -e LABELS=docker-test \
        --mount "type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock" \
        --mount "type=bind,source=/tmp/,target=/tmp/" \
        --secret source=jenkins-v4,target=jenkins \
        --constraint 'node.role==manager' \
        --network traefik \
        gauravjain1582/docker-swarm-jenkins-agent
