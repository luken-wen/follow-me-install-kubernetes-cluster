tags: worker, docker

# G. approve 脚本

## 执行 kubectl -it exec 报如下错误时
``` 
kubectl -it exec dnsutils-ds-qxbkd  nslookup kubernetes
Error from server: error dialing backend: remote error: tls: internal error
```

通过执行该脚本解决

``` bash
#!/bin/bash
for i in $(kubectl get csr | grep Pending | awk '{print $1}')
do
    kubectl certificate approve $i
done
```
