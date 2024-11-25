#!/bin/bash

# Example: ./00-prepare-node-roles-for-user.sh <user_name_tag_assigned_by_instructor> <instructor_name_tag>

# Setup ENV
source ~/cloud-env.sh

# Enter the classroom username such as "user2" assigned by the instructor. 
export USER=${1}
# The instructor's name tag shared by your instructor.
export TRAINER=${2}

# Setup PD1,2,3 as all node roles (4 ASGs: 1 ASG for PD, 1 ASG for TiFlash, 1 ASG for KV, 1 ASG for DB)
# Node 1
HOST_PD1_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=pd1" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_PD1_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=pd1" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

# Node 2
HOST_PD2_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=pd2" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_PD2_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=pd2" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

# Node 3
HOST_PD3_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=pd3" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_PD3_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=pd3" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

# Node 4
HOST_KV1_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=kv1" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_KV1_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=kv1" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

# Node 5
HOST_KV2_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=kv2" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_KV2_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=kv2" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

# Node 6
HOST_KV3_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=kv3" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_KV3_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=kv3" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

# Node 7
HOST_DB1_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=db1" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_DB1_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=db1" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

# Node 8
HOST_DB2_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=db2" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_DB2_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=db2" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

# Node 9
HOST_MONITOR1_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=monitor1" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_MONITOR1_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=monitor1" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

# (optional) nodes TiProxy
HOST_TIPROXY1_PRIVATE_IP=`aws ec2 describe-instances \
  --filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=user1" "Name=tag:role,Values=tiproxy1" "Name=tag:trainer,Values=${TRAINER}" \
  --query "Reservations[0].Instances[0].PrivateIpAddress" \
  --output text \
  --region ${REGION_CODE}`

HOST_TIPROXY2_PRIVATE_IP=`aws ec2 describe-instances \
  --filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=user1" "Name=tag:role,Values=tiproxy2" "Name=tag:trainer,Values=${TRAINER}" \
  --query "Reservations[0].Instances[0].PrivateIpAddress" \
  --output text \
  --region ${REGION_CODE}`

echo export HOST_MONITOR1_PRIVATE_IP=${HOST_MONITOR1_PRIVATE_IP} > ./hosts-env.sh
echo export HOST_MONITOR1_PUBLIC_IP=${HOST_MONITOR1_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_CM_PRIVATE_IP=${HOST_MONITOR1_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_CM_PUBLIC_IP=${HOST_MONITOR1_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_PD1_PRIVATE_IP=${HOST_PD1_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_PD1_PUBLIC_IP=${HOST_PD1_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_PD2_PRIVATE_IP=${HOST_PD2_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_PD2_PUBLIC_IP=${HOST_PD2_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_PD3_PRIVATE_IP=${HOST_PD3_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_PD3_PUBLIC_IP=${HOST_PD3_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_DB1_PRIVATE_IP=${HOST_DB1_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_DB1_PUBLIC_IP=${HOST_DB1_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_DB2_PRIVATE_IP=${HOST_DB2_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_DB2_PUBLIC_IP=${HOST_DB2_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_KV1_PRIVATE_IP=${HOST_KV1_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_KV1_PUBLIC_IP=${HOST_KV1_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_KV2_PRIVATE_IP=${HOST_KV2_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_KV2_PUBLIC_IP=${HOST_KV2_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_KV3_PRIVATE_IP=${HOST_KV3_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_KV3_PUBLIC_IP=${HOST_KV3_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_TIPROXY1_PRIVATE_IP=${HOST_TIPROXY1_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_TIPROXY2_PRIVATE_IP=${HOST_TIPROXY2_PRIVATE_IP} >> ./hosts-env.sh

source ./hosts-env.sh

echo ssh -A ${HOST_CM_PRIVATE_IP} > ./ssh-to-cm.sh
echo ssh -A ${HOST_PD1_PRIVATE_IP} > ./ssh-to-pd1.sh
echo ssh -A ${HOST_PD2_PRIVATE_IP} > ./ssh-to-pd2.sh
echo ssh -A ${HOST_PD3_PRIVATE_IP} > ./ssh-to-pd3.sh
echo ssh -A ${HOST_DB1_PRIVATE_IP} > ./ssh-to-db1.sh
echo ssh -A ${HOST_DB2_PRIVATE_IP} > ./ssh-to-db2.sh
echo ssh -A ${HOST_MONITOR1_PRIVATE_IP} > ./ssh-to-monitor.sh
echo ssh -A ${HOST_KV1_PRIVATE_IP} > ./ssh-to-kv1.sh
echo ssh -A ${HOST_KV2_PRIVATE_IP} > ./ssh-to-kv2.sh
echo ssh -A ${HOST_KV3_PRIVATE_IP} > ./ssh-to-kv3.sh
echo ssh -A ${HOST_TIPROXY1_PRIVATE_IP} > ./ssh-to-tiproxy1.sh
echo ssh -A ${HOST_TIPROXY2_PRIVATE_IP} > ./ssh-to-tiproxy2.sh
chmod +x ./*.sh

# Setup Ten Nodes TiDB Cluster Topology
cp ./template-nine-nodes.yaml ./nine-nodes.yaml
sed -i '' \
  -e "s/<HOST_PD1_PUBLIC_IP>/${HOST_PD1_PUBLIC_IP}/g" \
  -e "s/<HOST_PD2_PUBLIC_IP>/${HOST_PD2_PUBLIC_IP}/g" \
  -e "s/<HOST_PD3_PUBLIC_IP>/${HOST_PD3_PUBLIC_IP}/g" \
  -e "s/<HOST_PD1_PRIVATE_IP>/${HOST_PD1_PRIVATE_IP}/g" \
  -e "s/<HOST_PD2_PRIVATE_IP>/${HOST_PD2_PRIVATE_IP}/g" \
  -e "s/<HOST_PD3_PRIVATE_IP>/${HOST_PD3_PRIVATE_IP}/g" \
  -e "s/<HOST_KV1_PRIVATE_IP>/${HOST_KV1_PRIVATE_IP}/g" \
  -e "s/<HOST_KV2_PRIVATE_IP>/${HOST_KV2_PRIVATE_IP}/g" \
  -e "s/<HOST_KV3_PRIVATE_IP>/${HOST_KV3_PRIVATE_IP}/g" \
  -e "s/<HOST_DB1_PRIVATE_IP>/${HOST_DB1_PRIVATE_IP}/g" \
  -e "s/<HOST_DB2_PRIVATE_IP>/${HOST_DB2_PRIVATE_IP}/g" \
  -e "s/<HOST_MONITOR1_PRIVATE_IP>/${HOST_MONITOR1_PRIVATE_IP}/g" \
  -e "s/<HOST_MONITOR1_PUBLIC_IP>/${HOST_MONITOR1_PUBLIC_IP}/g" \
  ./nine-nodes.yaml 2>/dev/null

# Setup TiUP Cluster Topology
cp ./template-meta.yaml ./meta.yaml
sed -i '' \
  -e "s/<HOST_PD1_PRIVATE_IP>/${HOST_PD1_PRIVATE_IP}/g" \
  -e "s/<HOST_PD2_PRIVATE_IP>/${HOST_PD2_PRIVATE_IP}/g" \
  -e "s/<HOST_PD3_PRIVATE_IP>/${HOST_PD3_PRIVATE_IP}/g" \
  -e "s/<HOST_KV1_PRIVATE_IP>/${HOST_KV1_PRIVATE_IP}/g" \
  -e "s/<HOST_KV2_PRIVATE_IP>/${HOST_KV2_PRIVATE_IP}/g" \
  -e "s/<HOST_KV3_PRIVATE_IP>/${HOST_KV3_PRIVATE_IP}/g" \
  -e "s/<HOST_DB1_PRIVATE_IP>/${HOST_DB1_PRIVATE_IP}/g" \
  -e "s/<HOST_DB2_PRIVATE_IP>/${HOST_DB2_PRIVATE_IP}/g" \
  -e "s/<HOST_MONITOR1_PRIVATE_IP>/${HOST_MONITOR1_PRIVATE_IP}/g" \
  ./meta.yaml 2>/dev/null

# Setup TiProxy
cp ./template-tiproxy.toml ./tiproxy.toml
sed -i '' \
  -e "s/<HOST_PD1_PRIVATE_IP>/${HOST_PD1_PRIVATE_IP}/g" \
  -e "s/<HOST_PD2_PRIVATE_IP>/${HOST_PD2_PRIVATE_IP}/g" \
  -e "s/<HOST_PD3_PRIVATE_IP>/${HOST_PD3_PRIVATE_IP}/g" \
  ./tiproxy.toml 2>/dev/null

# Copy hosts-env.sh to user home. It's also a safe operation if the PWD is user home. 
cp ./hosts-env.sh ~/hosts-env.sh 2>>/dev/null

# Place X509 to TiDB nodes.
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes -keyout key.pem -out cert.pem -subj "/CN=example.com"

chmod 400 key.pem

scp -A -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no key.pem ec2-user@${HOST_DB1_PRIVATE_IP}:/home/ec2-user/
scp -A -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no cert.pem ec2-user@${HOST_DB1_PRIVATE_IP}:/home/ec2-user/
scp -A -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no key.pem ec2-user@${HOST_DB2_PRIVATE_IP}:/home/ec2-user/
scp -A -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no cert.pem ec2-user@${HOST_DB2_PRIVATE_IP}:/home/ec2-user/

# Place TiProxy configuration to TiProxy nodes.
scp -A -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no /home/ec2-user/tiproxy.toml ec2-user@${HOST_TIPROXY1_PRIVATE_IP}:/home/ec2-user/
scp -A -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no /home/ec2-user/tiproxy.toml ec2-user@${HOST_TIPROXY2_PRIVATE_IP}:/home/ec2-user/


echo
echo "9 nodes are prepared for user ${USER} and trainer ${TRAINER}."
