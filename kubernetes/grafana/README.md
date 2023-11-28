joe@SODG:~/mlops$ kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode;echo
5r7n1EKCjGXuzcVenrQnOl8Lx6bHLoocJlNGpnVx
joe@SODG:~/mlops$ kubectl port-forward svc/grafana 3000:80 -n monitoring


https://github.com/olawaleoyg/devops-mlops/blob/main/kubernetes/jenkins/README.md