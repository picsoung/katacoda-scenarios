ssh root@host01 "docker pull registry.access.redhat.com/rhscl/redis-32-rhel7"
ssh root@host01 "docker pull registry.access.redhat.com/rhscl/mysql-56-rhel7.access.redhat.com/rhscl/redis-32-rhel7"
ssh root@host01 "docker pull registry.access.redhat.com/3scale-amp20/system"
# ssh root@host01 "docker pull openshiftroadshow/parksmap-katacoda:1.0.0"
# ssh root@host01 'for i in {1..200}; do oc policy add-role-to-user system:image-puller system:anonymous && break || sleep 1; done'
