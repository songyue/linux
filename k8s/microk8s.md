MicroK8s学习

参考文档 https://microk8s.io/docs/

lsb_release -a
    No LSB modules are available.
    Distributor ID:	Ubuntu
    Description:	Ubuntu 18.04.3 LTS
    Release:	18.04
    Codename:	bionic

uname -a
    Linux ubuntu-node1 4.15.0-72-generic #81-Ubuntu SMP Tue Nov 26 12:20:02 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

docker --version
    Docker version 18.09.7, build 2d0083d

1.安装 
    sudo snap install microk8s --classic --channel=1.16/stable

2.检查状态
    sudo microk8s.status --wait-ready

3.访问Kubernets
    查看节点： microk8s.kubectl get nodes
    或者查看运行的服务： microk8s.kubectl get services
    配置别名 alias kubectl='microk8s.kubectl'

4.部署应用
    microk8s.kubuctl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1
    检查安装状态: microk8s.kubectl get pods

5.使用附加组件
    microk8s.enable dns storage
    microk8s.disable dns

    可用组件可使用 microk8s.status 查看
        api-server
        controller-manager
        scheduler
        kubelet
        cni
        kube-proxy

6.启动和停止MicroK8s
    microk8s.stop
    microk8s.start

========================
启用仪表盘(dashboard)组件

    microk8s.enable dashboard

如果未启用RBAC，则使用以下方法检索的默认令牌访问仪表板：
    token=$(microk8s.kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
    microk8s.kubectl -n kube-system describe secret $token

输出如下内容：
    Name:         default-token-rp5tn
    Namespace:    kube-system
    Labels:       <none>
    Annotations:  kubernetes.io/service-account.name: default
                  kubernetes.io/service-account.uid: 8a7d9595-7100-4e0f-85ce-f6a71c36403f

    Type:  kubernetes.io/service-account-token

    Data
    ====
    ca.crt:     1103 bytes
    namespace:  11 bytes
    token:      eyJhbGciOiJSUzI1NiIsImtpZCI6IkNhZVRoeDZfLVQ5bEpmWXRYRXpVR05ubG1XSEZEOW1RXzdQRjFoQ2pNLW8ifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJkZWZhdWx0LXRva2VuLXJwNXRuIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6ImRlZmF1bHQiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiI4YTdkOTU5NS03MTAwLTRlMGYtODVjZS1mNmE3MWMzNjQwM2YiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZS1zeXN0ZW06ZGVmYXVsdCJ9.OPm85tQRc-A2jW9oEJdomSB9jiax8Sbxxp15eiAmgxi6MKm_wB5hNYpGuBe9gLjjrTiOX8QAeX7wtTlpvk-0sfxmqDqD6EAIY5B6-2qA0_u_NlKydFxMvina2IjJhqE6TnUvHXyggbgx938pPhtFwqGvWgAxKpPLUkFiMGy0MgEiPND4d4uPvEffVioR2kr8GqGBEJI3jQvN38jLvOTzOWn0Cla37zt-hqO9f4KZHu8qJ1eRuuGl8jplR8OtGfOyDHxApUUMYJU3csCdg03voFyCvNEI5w_L6cDSrSnCr-g0fa0pMiYAWDEJwckMfhjOoyJcnXFn4Tpl4yhTbpvHWw

启用rbac
    microk8s.enable rbac


